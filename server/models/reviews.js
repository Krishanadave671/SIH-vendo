const mongoose = require("mongoose");

const reviewDetails = mongoose.Schema({
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
})

const Review = mongoose.model("Review", reviewDetails);
module.exports = Review;