const mongoose = require("mongoose");
const complaintSchema = require("./complaints")

const vendorDetails = mongoose.Schema({
    vendorid: {
        type: Number, 
        required: true, 
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
    aadhaarno: {
      type: String,
      required: true,
      trim: true,
      validate: {
        validator: function (v) {
          return /^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$/.test(v);
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
        message: '{VALUE} is not a valid Aadhar number!'
      }
    },
    passport: {
      type: Boolean
    },
    electionid: {
      type: Boolean
    },
    mcgmlicense: {
      type: Boolean
    },
    aadharcard: {
      type: String
    },
    pancard: {
      type: String
    },
    shoplocation: {
      type: String
    },
    creditscore: {
      type: Number
    },
    complaints: [complaintSchema]
});

const Vendor = mongoose.model("Vendor", vendorDetails);
module.exports = Vendor;