const express = require('express'); 
const Vendor = require("../models/vendor_details");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

//Sign Up
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, address, dob, gender, phone, aadharno, pancardno, 
                passport, electionid, mcgmlicense, aadharcard, pancard, shoplocation} = req.body;
        
        const existingVendor = await Vendor.findOne({ phone });
        if (existingVendor) {
            return res
            .status(400)
            .json({ msg: "Vendor with same phone number exists! "});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let vendor = new Vendor({
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
            shoplocation
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
    
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
          return res.status(400).json({ msg: "Incorrect password." });
        }
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
});