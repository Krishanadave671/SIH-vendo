const { S_IFCHR } = require('constants');
const express = require('express');
const { findOne } = require('../models/vendingzones');
const bazzarsrouter = express.Router(); 
const Vendors = require("../models/vendor_details");
const Bazzars = require("../models/weeklybazzar");

// add bazzar
bazzarsrouter.post("/api/addbazzar", async (req, res) => {
    try{
        const {bazzarId,vendorTypeFavourable,  bazzarName, bazzarDescription, bazzarDate ,bazzarAddress , bazzarMaximumCapacity, bazzarImageUrl, bazzarLat, bazzarLong, bazzarCity} = req.body;
        let bazzar = new Bazzars({
            bazzarId, bazzarName, bazzarDescription, bazzarImageUrl, bazzarLat, bazzarLong, bazzarCity, 
            bazzarDate ,bazzarAddress , bazzarMaximumCapacity,  vendorTypeFavourable
        });
        bazzar = await bazzar.save();
        res.status(200).json(bazzar);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});


//get bazaars by city and bazzarDate 
bazzarsrouter.post("/api/getbazzarsbycityandDate", async (req, res) => {
    try {
        const {city, bazzarDate} = req.body;
        let bazzars = await Bazzars.find({bazzarCity: city, bazzarDate: bazzarDate});
        res.status(200).json(bazzars);
    }catch(e){
        res.status(500).json({e : e.message});
    }
} );

// get bazzar by bazzarId
bazzarsrouter.get("/api/getbazzar/:bazzarId", async (req, res) => {
    try {
        const {bazzarId} = req.params;
        let bazzar = await Bazzars.find({bazzarId: bazzarId});
        res.status(200).json(bazzar);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

// register for weekly bazaars 
bazzarsrouter.post("/api/registerforbazzar", async (req, res) => {
    try {
       const {bazzarId , vendorId , bazzarName} = req.body;
       let vendor1 = await Vendors.findOne({vendorId : vendorId});
       console.log(vendor1.weeklyBazzarList);
       let n = vendor1.weeklyBazzarList.length;  
       console.log(n); 
       for(let i = 0  ; i < n ; i++){
              if(vendor1.weeklyBazzarList[i].bazzarId == bazzarId){
                res.status(200).json({e : "Already registered"});
                return; 
              }   
       }
        let bazaars = await Bazzars.findOneAndUpdate({bazzarId : bazzarId},{ "$push": {vendorRegisteredList: {vendorId: vendorId}}}, {new: true});
         let vendor = await Vendors.findOneAndUpdate({vendorId : vendorId},{ "$push": {weeklyBazzarList: {bazzarId: bazzarId, bazzarName: bazzarName}}}, {new: true});
          res.status(200).json(vendor);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

// approved bazzar by admin
bazzarsrouter.post("/api/approvebazzar", async (req, res) => {
    try {
        
        const {bazzarId , vendorId} = req.body;
    
        await Bazzars.findOneAndUpdate({bazzarId : bazzarId , "vendorRegisteredList.vendorId" : vendorId },
        {"$set" : {"vendorRegisteredList.$.vendorstatus" : "approved"}}, {new: true});
     let vendors = await Vendors.findOneAndUpdate({ vendorId : vendorId , "weeklyBazzarList.bazzarId" : bazzarId },
        {"$set" : {"weeklyBazzarList.$.status" : "approved"}}, {new: true});
        return res.status(200).json(vendors);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

// reject bazzar by admin
bazzarsrouter.post("/api/rejectbazzar", async (req, res) => {
    try {
        const {bazzarId , vendorId} = req.body;
        await Bazzars.findOneAndUpdate({bazzarId : bazzarId , "vendorRegisteredList.vendorId" : vendorId },
        {"$set" : {"vendorRegisteredList.$.vendorstatus" : "rejected"}}, {new: true});
     let vendors = await Vendors.updateOne({ vendorId : vendorId , "weeklyBazzarList.bazzarId" : bazzarId },
        {"$set" : {"weeklyBazzarList.$.status" : "rejected"}}, {new: true});
        return res.status(200).json(vendors);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

// get all weekly bazaars pending by descending order 
bazzarsrouter.get("/api/getallpendingbazaars", async (req, res) => {
    try {
        let bazzars = await Bazzars.find({vendorRegisteredList : {$elemMatch : {vendorstatus : "pending"}}}).sort({bazzarDate : -1});
        res.status(200).json(bazzars);
    }catch(e){
        res.status(500).json({e : e.message});
    }
} );
bazzarsrouter.get("/api/getallbazaars", async (req, res) => {
    try {
        let bazzars = await Bazzars.find({});
        res.status(200).json(bazzars);
    }catch(e){
        res.status(500).json({e : e.message});
    }
} );

bazzarsrouter.get("/api/getpendingvendorregisteredlist/:bazzarid" , async (req , res) => {
    try {
        const {bazzarid} = req.params;
        let bazzars = await Bazzars.findOne({bazzarId : bazzarid});
        list = []; 
        for(let i = 0 ; i < bazzars.vendorRegisteredList.length ; i++){
            if(bazzars.vendorRegisteredList[i].vendorstatus == "pending"){
                list.push(bazzars.vendorRegisteredList[i]);
            }
        } 
        res.status(200).json(list);
    }catch(e){
        res.status(500).json({e : e.message});
    }
})

module.exports = bazzarsrouter;