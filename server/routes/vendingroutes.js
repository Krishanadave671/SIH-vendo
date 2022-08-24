const express = require('express'); 
const vendingzonerouter = express.Router(); 
const  vendingzones  = require("../models/vendingzones"); 
const Vendor = require("../models/vendor_details");

// find vendingzones according to location search bar for vendors app
vendingzonerouter.get("/api/getvendingzones/search/:city/:tax/:vendorcategory"  , async (req , res) => { 
    try {
        const { city,tax ,vendorcategory  } = req.params ; 
        let vendingzone = await vendingzones.find({
            vendingzonecity : city , 
            vendingzonelocationtax : { $lte : tax}, 
            categoryofvendorsNotAllowed : { $nin : vendorcategory} 
        }); 
        console.log("Hello world "); 
        res.status(200).json(vendingzone); 
    }catch(e) {
        res.status(500).json({e : e.message}); 
    }
})


// find vendingzones by id
vendingzonerouter.get("/api/getvendingzonesbyId/:id"  , async (req , res) => {
    try {
        const { id } = req.params;
        let vendingzone = await vendingzones.find({ vendingzoneId : id });
        res.status(200).json(vendingzone[0]);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
})

// find all vendingzones.. 
vendingzonerouter.get("/api/getvendingzones/search" , async (req, res) =>  { 
    try {
        let vendingzone = await vendingzones.find({}).sort({pendingRegistrations:-1}); 
        res.status(200).json(vendingzone); 
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})

// post request to add vendingzones in location 
vendingzonerouter.post("/api/addvendingzones", async (req, res) => {

    try{ 
         let vendingZone = new vendingzones(req.body);
         const {vendingZoneCity} = vendingZone; 
         vendingZone.vendingZoneId = "V" + vendingZoneCity + Math.random().toString(36).replace(/[^a-z]+/g, '').substring(0, 50-vendingZoneCity.length); 
         vendingZone = await vendingZone.save(); 
         res.json(vendingZone.json); 
    }catch (error){
        res.status(500).json({ error: error.message });
        console.log(error); 
    }
    
}); 

//get pending vendors
vendingzonerouter.get("/api/getvendorbyvendingzone/pending", async(req, res) => {
    try{
        const {vendingZoneId} = req.body;
        let pendingApplications = await Vendor.find({vendingZoneIdApplied: vendingZoneId, isApproved: "pending"}); 
        res.status(200).json(pendingApplications);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
})

//get approved vendors
vendingzonerouter.get("/api/getvendorbyvendingzone/approved", async(req, res) => {
    try{
        const {vendingZoneId} = req.body;
        let pendingApplications = await Vendor.find({vendingZoneIdApplied: vendingZoneId, isApproved: "approved"}); 
        res.status(200).json(pendingApplications);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
})

//update status to approved
vendingzonerouter.post("/api/approvevendor", async(req, res) => {
    try{
        const {vendingZoneId, vendorId} = req.body;
        let vendor = await Vendor.findOneAndUpdate({vendorId: vendorId}, {isApproved: "approved"}, {new: true});
        await vendingzones.findOneAndUpdate({vendingZoneId: vendingZoneId}, {$inc: {pendingRegistrations: -1}, "$push": {vendorIdList: {vendorId: vendorId}}}, {new: true});
        res.status(200).json(vendor);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
})

//update status to rejected
vendingzonerouter.post("/api/rejectvendor", async(req, res) => {
    try{
        const {vendingZoneId, vendorId} = req.body;
        let vendor = await Vendor.findOneAndUpdate({vendorId: vendorId}, {isApproved: "rejected"}, {new: true});
        await vendingzones.findOneAndUpdate({vendingZoneId: vendingZoneId}, {$inc: {pendingRegistrations: -1}, "$push": {vendorIdList: {vendorId: vendorId}}}, {new: true});
        res.status(200).json(vendor);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
})

//get pending vendors by city, vendingzone
vendingzonerouter.get("/api/getvendorbyvendingzone/pending/:location", async(req, res) => {
    try{
        const {location} = req.params;
        const {vendingZoneId} = req.body;
        let pendingApplications = await Vendor.find({vendingZoneIdApplied: vendingZoneId, isApproved: "pending", vendingZoneCity: location}); 
        res.status(200).json(pendingApplications);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
})
module.exports = vendingzonerouter; 
