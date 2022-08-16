const mongoose = require("mongoose");
const complaintSchema = require("./complaints")

const vendorDetails = mongoose.Schema({
    vendorid: {
        type: String,  
        trim: true, 
        unique: true 
      },
    name: {
        required: true,
        type: String,
        trim: true,
    },
    dob: {
        required: true,
        type: String
    },
    gender: {
        required: true,
        type: String
    },
    address: {
        type: String,
        default: "",
    },
    password: {
      required: true,
      type: String,
    },
    phone: {
      type: String,
      required: true,
      trim: true,
      validate: {
        validator: function (v) {
          return /^[0-9]{10}/.test(v);
        },
        message: '{VALUE} is not a valid 10 digit phone number!'
      }
    },
    aadharno: {
      type: String,
      required: true,
      trim: true,
      validate: {
        validator: function (v) {
          return /^[0-9]{12}/.test(v);
        },
        message: '{VALUE} is not a valid Aadhar number!'
      }
    },
    pancardno: {
      type: String,
      required: true,
      trim: true,
      validate: {
        validator: function (v) {
          return /[A-Z]{5}[0-9]{4}[A-Z]{1}/.test(v);
        },
        message: '{VALUE} is not a valid Pancard number!'
      }
    },
    passport: {
      type: Boolean, 
      required : true
    },
    electionid: {
      type: Boolean, 
      required : true 
    },
    mcgmlicense: {
      type: Boolean, 
      required : true 
    },
    aadharcard: {
      type: String, 
      required : true 
    },
    pancard: {
      type: String, 
      required : true 
    },
    shoplocation: {
      type: String, 
      required : true 
    },
    creditscore: {
      type: Number
    },
    vendorImageurl : {
      type : String , 
      default : "https://avatars.githubusercontent.com/u/84977709?v=4" 
    } , 
    isapproved : {
      type : String  , 
      default : "pending" 
    }, 
    complaints: [complaintSchema], 
    vendorcategory : {
      type : String , 
      required : true 
    }
});

const Vendor = mongoose.model("Vendor", vendorDetails);
module.exports = Vendor;