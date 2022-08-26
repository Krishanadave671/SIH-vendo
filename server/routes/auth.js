const express = require('express');
const Vendor = require("../models/vendor_details");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const vendingzones = require("../models/vendingzones");

//Sign Up
authRouter.post("/api/signup", async(req, res) => {
    try {

        const {phone , password , vendingZoneIdApplied}  =  req.body ; 
        const existingVendor = await Vendor.findOne({ phone });
        if (existingVendor) {
            return res
                .status(400)
                .json({ msg: "Vendor with same phone number exists! " });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let vendor = new Vendor({...req.body , password : hashedPassword});

        
        vendor = await vendor.save();
        await vendingzones.findOneAndUpdate({ vendingZoneId: vendingZoneIdApplied }, { $inc: { pendingRegistrations: 1 } });
        res.json(vendor);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }

});


// setting inTime 
authRouter.post("/api/setintime", async(req, res) => {
    try {
        const { vendorId, inTime } = req.body;
        let vendor = await Vendor.findOneAndUpdate({ vendorId: vendorId }, { inTime: inTime }, { new: true });
        res.status(200).json(vendor);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
}); 
// senduserlive location lat and long 
authRouter.post("/api/senduserlivelocation", async(req, res) => {
    try {
        const { vendorId, shopLocationLat, shopLocationLong } = req.body;   
        let vendor = await Vendor.findOneAndUpdate({ vendorId: vendorId }, { shopLocationLat: shopLocationLat, shopLocationLong: shopLocationLong }, { new: true });
        res.status(200).json(vendor);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
}),

authRouter.get("/api/getvendorlivelocation/:city", async (req, res) => {
   
    try{
        const {city} = req.params;
        let vendor = await Vendor.find({shopCity : city ,}).select({ shopLocationLat: 1, shopLocationLong: 1 });
    res.status(200).json(vendor);

    }catch (e) {
        res.status(500).json({ error: e.message });
    }   
})
//Sign In
authRouter.post("/api/login", async(req, res) => {
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
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post("/api/tokenIsValid", async(req, res) => {
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
authRouter.get("/getuserdata", auth, async(req, res) => {
    const vendor = await Vendor.findById(req.vendor);
    console.log(vendor);
    res.json({ token: req.token, ...vendor._doc });
});

authRouter.post("/checkapprovalstatus", async(req, res) => {
    try {
        const { vendorId } = req.body;
        let vendorapprovalstatus = await Vendor.findOne({ vendorId: vendorId });
        if (vendorapprovalstatus.isApproved == "approved") {
            res.send("approved");
        } else if (vendorapprovalstatus.isApproved == "rejected") res.send("rejected");
        else res.send("pending");
    } catch (e) {
        res.status(500).send({ error: e.message });
    }

})

//get approved vendors
authRouter.get("/api/getvendors/approved", async(req, res) => {
    try {
        let vendors = await Vendor.find({ isApproved: "approved" });
        res.status(200).json(vendors);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
})

// get vendors by id
authRouter.get("/api/getvendorsfromID/:id", async(req, res) => {
        try {
            const { id } = req.params;
            let vendor = await Vendor.find({ vendorId: id });
            res.status(200).json(vendor[0]);
        } catch (e) {
            res.status(500).json({ e: e.message });
        }
    })
    //get pending vendors
authRouter.get("/api/getvendors/pending", async(req, res) => {
    try {
        let vendors = await Vendor.find({ isApproved: "pending" });
        res.status(200).json(vendors);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
})

//get pending vendors by location
authRouter.get("/api/getvendors/pending/:location", async(req, res) => {
    try {
        const { location } = req.params;
        let vendors = await Vendor.find({ isApproved: "pending", shopCity: location });
        res.status(200).json(vendors);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
}) 


// set vendors checkin and checkout time -- set inOrOutTime
// get vendors checkin and checkout time Lists 
// - track vendors first in or out 
// - if in -- set inOrOutTime to true
// - if out -- set inOrOutTime to false





//get approved vendors by location
authRouter.get("/api/getvendors/approved/:location", async(req, res) => {
    try {
        const { location } = req.params;
        let vendors = await Vendor.find({ isApproved: "approved", shopCity: location });
        res.status(200).json(vendors);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
}) 

module.exports = authRouter;


authRouter.post("/api/setvendortime", async(req, res) => {
    try{
        const {vendorId, inOrOut, time } = req.body;
        let vendor = await Vendor.findOne({vendorId});
        if (inOrOut == true){
            await Vendor.updateOne({vendorId},  {inOrOut: true, "$push": {inTime: time}});
        }
        else {
            await Vendor.updateOne({vendorId}, {inOrOut: false, "$push": {outTime: time}});
        }
        res.status(200).json(vendor);
    }catch (e) {
        res.status(500).json({ e: e.message });
    }
})

    


module.exports = authRouter;

