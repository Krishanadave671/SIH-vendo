const mongoose = require("mongoose");

const reviewSchema = mongoose.Schema({
    reviewId: {
        type: String,
        required: true,
        unique: true
    },
    vendorId : {
        type : String ,
        required : true,  
    } , 
    isApprovedLocation: {
        type: Boolean,
        required: true
    },
    isFootTraffic: {
        type: Boolean,
        required: true
    },
    isLegalAge: {
        type: Boolean,
        required: true
    },
    waterClogging: {
        type: String,
        required: true
    },
    foodCover: {
        type: String
    },
    cleanDrinkingWater: {
        type: String
    },
    vendorWearingGloves: {
        type: String
    },
    shortDescription: {
        type: String,
        required: true
    },
    reviewImageUrl: {
        type: String
    },
    creditScoreAbsolute: {
        type: Number,
        required: true
    },
    bmcOfficerId: {
        type: String,
        required: true
    }
});

module.exports = reviewSchema;