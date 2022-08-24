const express = require('express');
const schemerouter = express.Router();
const Schemes = require("../models/schemes");
const Vendor  = require('../models/vendor_details');
// add scheme
schemerouter.post("/api/addscheme", async(req, res) => {
    try {
        const { schemeId, schemeName, schemeBenefits, schemeReq, schemeImageUrl } = req.body;
        let scheme = new Schemes({
            schemeId,
            schemeName,
            schemeBenefits,
            schemeReq,
            schemeImageUrl
        });
        scheme = await scheme.save();
        res.status(200).json(scheme);
    } catch (e) {
        res.status(500).json({ e: e.message });
    }
});
// fetch all schemes
schemerouter.get("/api/getschemes/all", async(req, res) => {
    console.log("inside get government schema");
    try {
        let schemes = await Schemes.find();
        res.status(200).json(schemes);

    } catch (e) {
        res.status(500).json({ e: e.message });
    }
});

// approve schemes 
// reject schemes 
// get schemedetails by Id 
schemerouter.get("/api/getschemeid", async(req, res) => {
    try {
        let schemes = await Schemes.find({});
        let schemeId = schemes.length + 1;
        res.status(200).json(schemeId);
    } catch (e) {
        res.status(500).json(e.message);
    }
});
// apply for schemes
schemerouter.post("/api/applyscheme" , async(req, res) => {
  try{
    let {schemeId, vendorId} = req.body;
    let vendor = await Vendor.findOneAndUpdate({vendorId : vendorId},
         {"$push" : {schemeList : {schemeId : schemeId}}}, {new : true});
    await Schemes.findOneAndUpdate({schemeId : schemeId},
         {"$push" : {vendorappliedList : {vendorId : vendorId}}}, {new : true});
         res.status(200).json(vendor); 
  }catch (e){
    res.status(500).json({e : e.message});
  }
})

// approve schemes 
schemerouter.post("/api/approvescheme" , async(req, res) => {
    try{
        let {schemeId , vendorId} = req.body;
        let vendor = await Vendor.findOneAndUpdate({vendorId : vendorId, "schemeList.schemeId" : schemeId},
          {  schemeList : {schemeId : schemeId , status : "approved"} }, {new : true});
        await Schemes.findOneAndUpdate({schemeId : schemeId, "vendorappliedList.vendorId" : vendorId},
            {  vendorappliedList : {vendorId : vendorId , vendorStatus : "approved"} }, {new : true});
        res.status(200).json(vendor); 
    }catch (e){
        res.status(500).json({e : e.message});
    }
})
// getschemesbyId
schemerouter.post("/api/getschemebySchemeId" , async(req, res) => {
    try{
        let {schemeId } = req.body;
        let scheme = await Schemes.findOne({schemeId : schemeId});
        res.status(200).json(scheme); 
    }catch (e){
        res.status(500).json({e : e.message});
    }
})
schemerouter.post("/api/rejectscheme" , async(req, res) => {
    try{
        let {schemeId , vendorId} = req.body;
        let vendor = await Vendor.findOneAndUpdate({vendorId : vendorId, "schemeList.schemeId" : schemeId},
          {  schemeList : {schemeId : schemeId , status : "rejected"} }, {new : true});
        await Schemes.findOneAndUpdate({schemeId : schemeId, "vendorappliedList.vendorId" : vendorId},
            {  vendorappliedList : {vendorId : vendorId , vendorStatus : "rejected"} }, {new : true});
        res.status(200).json(vendor); 
    }catch (e){
        res.status(500).json({e : e.message});
    }
})


module.exports = schemerouter;