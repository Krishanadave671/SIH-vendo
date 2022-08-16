const mongoose = require('mongoose');

const vendingzoneSchema = new mongoose.Schema({
    vendingzoneid : {
        type : String  , 
        required : true , 
        unique : true 
    }, 
    vendingzonestreetName : {
        type : String, 
        required : true , 
    }, 
    vendingzonelocation : {
        type : String , 
        required : true 
    }, 
    vendingzonedescription : {
        type : String , 
        required : true , 
    },
    vendingzoneImageurl : { 
        type : String , 
        default : "https://lh5.googleusercontent.com/p/AF1QipM8YeTMOC9DfdD7GmXMnGN9OuG9MrQYOn24eHta=w408-h306-k-no"
    }, 
    maximumVendorsallowed : { 
        type : Number, 
        required : true 
    }, 
    vendingzonecity : { 
        type : String , 
        required : true , 
        trim : true 
    }, 
    vendingzoneward : {
        type : String ,  
        required : true , 
        trim : true 
    },
    vendingzonelocationtax : { 
        type : Number , 
        required : true , 
        trim : true 
    },
    vendingzoneAddress : { 
        type : String , 
        required : true , 
        trim : true 
    } , 
    categoryofvendorsNotAllowed : [String]
}) 

const vendingzones = mongoose.model('vendingzones', vendingzoneSchema);
module.exports = {vendingzones , vendingzoneSchema}; 