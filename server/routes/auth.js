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
        const {
            vendorId,
            vendorCategory,
            name,
            address,
            dob,
            gender,
            phone,
            aadharNo,
            panCardNo,
            password,
            isPassport,
            isElectionid,
            isMcgmLicense,
            aadharcardImageUrl,
            pancardImageUrl,
            shopLocationAddress,
            shopLocationLat,
            shopLocationLong,
            vendingZoneIdApplied,
            shopCity,
            isApproved,
            shopName,
        } = req.body;

        const existingVendor = await Vendor.findOne({ phone });
        if (existingVendor) {
            return res
                .status(400)
                .json({ msg: "Vendor with same phone number exists! " });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let vendor = new Vendor({
            vendorId,
            name,
            dob,
            gender,
            address,
            password: hashedPassword,
            phone,
            aadharNo,
            panCardNo,
            isPassport,
            isElectionid,
            isMcgmLicense,
            aadharcardImageUrl,
            pancardImageUrl,
            shopLocationAddress,
            shopLocationLat,
            shopLocationLong,
            vendingZoneIdApplied,
            shopCity,
            vendorCategory,
            isApproved,
            shopName,
        });
        vendor = await vendor.save();
        await vendingzones.findOneAndUpdate({ vendingZoneId: vendingZoneIdApplied }, { $inc: { pendingRegistrations: 1 } });
        // await vendingzones.findOneAndUpdate({vendingZoneId: vendingZoneIdApplied}, {"$push": {vendorIdList: {vendorId: vendorId, status: "pending"}}}, {new: true});
        res.json(vendor);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

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
    res.json({token: req.token ,...vendor._doc});
});

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