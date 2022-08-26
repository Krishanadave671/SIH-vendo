const express = require('express'); 
const reviewsrouter = express.Router(); 
const Vendor = require("../models/vendor_details");
const Review = require("../models/reviews");
// add review
reviewsrouter.post("/api/addreview", async (req, res) =>{
    try{
        const {vendorId} = req.body ; 
        let vendor = await Vendor.findOne({ vendorId : vendorId});
        let review = new Review(req.body); 
        review = await review.save(); 
        
        vendor.reviewList.push(review);
        let n  = vendor.reviewList.length ; 
        let sum = 0 ; 
        for(let i = 0 ; i < n ; i++){
           sum +=  vendor.reviewList[i].creditScoreAbsolute ;
        }
        vendor.creditScore = ((sum/(n*7))*100).toPrecision(3);
        vendor = await vendor.save();
        res.status(200).json(review);
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
});


// get all reviews of particular vendor
reviewsrouter.get("/api/getreviews/:vendorId", async(req, res) => {
    try{
        const {vendorId} = req.params;
        let vendor = await Vendor.findOne({ vendorId : vendorId});
        let reviews = vendor.reviewList;
        res.status(200).json(reviews); 
    }catch(e) {
        res.status(500).json({e : e.message});
    }
} );

reviewsrouter.get("/api/getreviewsfromcustomer/:cusid" , async (req , res )=> {
    try{
        const {cusid} = req.params;
        let reviews = await Review.find({bmcId : cusid});
        res.status(200).json(reviews);
    }catch(e){
        res.status(500).json({e : e.message});
    }
})

module.exports = reviewsrouter;``