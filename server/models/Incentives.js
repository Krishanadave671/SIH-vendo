const mongoose = require('mongoose'); 

const IncentiveDetails = mongoose.Schema({
    incentiveId: {
        type: String,
        unique : true,
        required: true
    },
    incentiveName: {
        type: String,
        required: true
    },
    incentiveBenefits: {
        type: String,
        required: true
    },
    incentiveDescription: {
        type: String,
        required: true
    },
    minCredit: {
        type: String,
        required : true 
    }, 
    incentiveReq : {
        type: String,
        required : true
    }
})

const Incentives = mongoose.model('Incentives', IncentiveDetails);
module.exports = Incentives;
