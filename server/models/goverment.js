const mongoose = require('mongoose'); 
const bcryptjs = require("bcryptjs");
const GovermentSchema = new mongoose.Schema({
    username : {
        type: String,
        unique : true,
        required: true
    },
    password : {
        type : String ,
        required : true
    },
 }) ; 


const Goverment = mongoose.model('Goverment', GovermentSchema);
module.exports = Goverment;