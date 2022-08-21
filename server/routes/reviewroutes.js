const express = require('express'); 
const reviewsrouter = express.Router(); 
const Vendor = require("../models/vendor_details");
// add review
reviewsrouter.post("/api/addreview", async (req, res) =>{
    try{
        const {vendorId} = req.body; 
        let vendors = await Vendor.findOne({vendorId : vendorId});
        const reviewSchema = req.body;
        console.log(reviewSchema); 
        vendors.reviewList
            .push(reviewSchema);
        vendors = await vendors.save(); 
        res.status(200).json(vendors);

    }catch (e){
        res.status(500).json({e : e.message});
    }
});

// get creditscorecount of particular vendor
// get all reviews of particular vendor

module.exports = reviewsrouter;