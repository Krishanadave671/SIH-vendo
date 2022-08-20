const mongoose = require('mongoose');

const vendingzoneSchema = new mongoose.Schema({
    vendingZoneId : {
        type : String  , 
        required : true , 
        unique : true 
    },  
    vendingZoneLocality : {
        type : String , 
        required : true 
    },
    vendingZoneLat : {
        type : Number , 
        required : true 
    }, 
    vendingZoneLong : {
        type : Number , 
        required : true 
    }, 
    vendingZoneDescription : {
        type : String , 
        required : true , 
    },
    vendingZoneImageurl : { 
        type : String , 
        default : "https://lh5.googleusercontent.com/p/AF1QipM8YeTMOC9DfdD7GmXMnGN9OuG9MrQYOn24eHta=w408-h306-k-no"
    }, 
    maximumVendorsAllowed : { 
        type : Number, 
        required : true 
    }, 
    vendingZoneCity : { 
        type : String , 
        required : true , 
        trim : true 
    }, 
    vendingZoneWard : {
        type : String ,  
        required : true , 
        trim : true 
    },
    vendingZoneLocationFee : { 
        type : Number , 
        required : true , 
        trim : true 
    },
    vendingZoneAddress : { 
        type : String , 
        required : true , 
        trim : true 
    }, 
    categoryOfVendorsNotAllowed : {
        type: [String],
        required: true
    },
    vendorTypeFavorable: {
        type: [String],
        required: true
    },
    vendorIdList: [{
        vendorId: {
            type: String
        }
    }],
    pendingRegistrations: {
        type: Number,
        default: 0
    }
}) 

const VendingZones = mongoose.model('vendingzones', vendingzoneSchema);
module.exports = VendingZones; 