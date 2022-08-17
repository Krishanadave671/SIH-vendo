const express = require('express'); 
const Vendor = require("../models/vendor_details");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

//Sign Up
authRouter.post("/api/signup", async (req, res) => {
    try {
        const {vendorid , vendorcategory , name, address, dob, gender, phone, aadharno, pancardno,password ,  
                passport, electionid, mcgmlicense, aadharcard, pancard, shoplocation, isapproved} = req.body;
        
        const existingVendor = await Vendor.findOne({ phone });
        if (existingVendor) {
            return res
            .status(400)
            .json({ msg: "Vendor with same phone number exists! "});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);
       
        let vendor = new Vendor({
          vendorid , 
            name,
            dob,
            gender,
            address,
            password: hashedPassword,
            phone,
            aadharno,
            pancardno,
            passport,
            electionid,
            mcgmlicense,
            aadharcard,
            pancard,
            shoplocation, 
            vendorcategory, 
            isapproved
        });
        vendor = await vendor.save();
        res.json(vendor);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//Sign In
authRouter.post("/api/login", async (req, res) =>{
    try {
        const { phone, password } = req.body;
        const vendor = await Vendor.findOne({ phone });
        if (!vendor) {
          return res
            .status(400)
            .json({ msg: "User with this phone number does not exist!" });
        }
    
        const isMatch = await bcryptjs.compare(password, vendor.password);
        if (!isMatch) {
          return res.status(400).json({ msg: "Incorrect password." });
        }

        const token = jwt.sign({ id: vendor._id }, "passwordKey");
        res.json({ token, ...vendor._doc });
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const vendor = await Vendor.findById(verified.id);
      if (!vendor) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  // get user data
  authRouter.get("/getuserdata", auth, async (req, res) => {
    const vendor = await Vendor.findById(req.vendor);
    res.json({ ...vendor._doc, token: req.token });
  });

  module.exports = authRouter;