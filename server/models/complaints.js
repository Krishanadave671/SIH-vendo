const mongoose = require("mongoose");

const complaintDetails = mongoose.Schema({
    complaintid: {
        type: String,  
        trim: true, 
        unique: true
    },
    complaintdate: {
        type: String,
        required: true
    },
    complaintstatus: {
        type: String,
        default: "pending"
    },
    complainttype: [{
        type: String
    }],
    imageurl: {
        type: String
    },
    complaintdescription: {
        type: String,
        required: true
    }
});

const Complaints = mongoose.model("Complaints", complaintDetails);
module.exports = Complaints;