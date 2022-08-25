const express = require('express'); 
const incentiverouter = express.Router();
const vendor = require('../models/vendor_details');
const Incentives = require("../models/incentives");

incentiverouter.post("api/addincentives", async(req , res) => {
    try{
        let incentiveId = "IC" +  Math.floor(1000 + Math.random() * 9000);
        let incentive = new Incentives({ incentiveId , ...req.body}); 
        incentive = await incentive.save();
        res.status(200).json(incentive);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

incentiverouter.get("api/getincentives/all", async(req , res) => {
    try{
        let incentives = await Incentives.find();
        res.status(200).json(incentives);
    }
    catch(e){
        res.status(500).json({e : e.message});
    }
} );


incentiverouter.get("api/getincentives/:vendorId", async(req , res) => {
    try{
        let incentives = await Incentives.find({vendorId : req.params.vendorId});
        res.status(200).json(incentives);
    }
    catch(e){
        res.status(500).json({e : e.message});
    }
} );
 

module.exports = incentiverouter ; 

