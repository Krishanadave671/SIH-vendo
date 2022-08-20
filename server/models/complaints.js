const mongoose = require("mongoose");

const complaintDetails = mongoose.Schema({
    vendorId: {
        type: String,
        trim: true,
        required : true 
    }, 
    complaintId: {
        type: String,  
        trim: true, 
        unique: true
    },
    complaintDate: {
        type: String,
        required: true
    },
    complaintStatus: {
        type: String,
        default: "pending"
    },
    complaintType: [{
        type: String
    }],
    complaintImageUrl: {
        type: String
    },
    complaintDescription: {
        type: String,
        required: true
    },
    complaintLocationLat: {
        type: Number,
        required: true
    },
    complaintLocationLong: {
        type: Number,
        required: true
    },
    complaintCity: {
        type: String,
        required: true
    }
});

const Complaints = mongoose.model("Complaints", complaintDetails);
module.exports = Complaints;