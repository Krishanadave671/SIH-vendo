const mongoose = require("mongoose");
const { complaints } = require("./complaints");
const { reviews } = require("./reviews");

const vendorDetails = mongoose.Schema({
    vendorId: {
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
            validator: function(v) {
                return /^[0-9]{10}/.test(v);
            },
            message: '{VALUE} is not a valid 10 digit phone number!'
        }
    },
    aadharNo: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: function(v) {
                return /^[0-9]{12}/.test(v);
            },
            message: '{VALUE} is not a valid Aadhar number!'
        }
    },
    panCardNo: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: function(v) {
                return /[A-Z]{5}[0-9]{4}[A-Z]{1}/.test(v);
            },
            message: '{VALUE} is not a valid Pancard number!'
        }
    },
    isPassport: {
        type: Boolean,
        required: true
    },
    isElectionid: {
        type: Boolean,
        required: true
    },
    isMcgmLicense: {
        type: Boolean,
        required: true
    },
    aadharcardImageUrl: {
        type: String,
        required: true
    },
    pancardImageUrl: {
        type: String,
        required: true
    },
    shopLocationAddress: {
        type: String,
        required: true
    },
    shopLocationLat: {
        type: Number,
        required: true
    },
    shopLocationLong: {
        type: Number,
        required: true
    },
    vendingZoneIdApplied: {
        type: String,
        required: true
    },
    shopCity: {
        type: String,
        required: true
    },
    creditScore: {
        type: Number,
        required: true,
        default: 0
    },
    vendorImageurl: {
        type: String,
        default: "https://avatars.githubusercontent.com/u/84977709?v=4"
    },
    isApproved: {
        type: String,
        default: "pending"
    },
    complaintsList: {
        type: [complaints]
    },
    reviewList: {
        type : [reviews]
    },
    weeklyBazzarList: [{
      "bazzarId" : {
        type: String,  
      },
      "bazzarName" : {
        type: String,
       
      },
      "status" : {
        type: String,
        default : "pending"
      } 
}]  ,
    schemeList :[{
      "schemeId" : {
        type: String,
        unique : true, 
        
      },
      "status" : {
        type: String,
        default : "pending"
      }
    }], 
    vendorCategory : {
      type : String , 
      required : true 
    }, 
    shopName : {
        type : String ,
        required : true ,
        trim : true
    }, 

    currentLat : {
        type : Number , 
    

    }, 
    currentLong : {
        type : Number , 
    }, 
    inTime : {
        type : [String] ,

    }, 
    outTime : {
        type : [String] ,
    },
    inOrOut : {
        type : Boolean ,
        default : true 
    }
})

const Vendor = mongoose.model("Vendor", vendorDetails);
module.exports = Vendor;