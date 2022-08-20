const mongoose = require("mongoose");

const weeklyBazzarDetails = mongoose.Schema({
    bazzarId: {
        type: String,
        reequired: true
    },
    vendorTypeFavourable: {
        type: [String],
        required: true
    },
    bazzarImageUrl: {
        type: String,
        required: true
    },
    bazzarLat: {
        type: String,
        required: true
    },
    bazzarLong: {
        type: String,
        required: true
    },
    bazzarName: {
        type: String,
        required: true
    },
    bazzarAddress: {
        type: String,
        required: true
    },
    bazzarMaximumCapacity: {
        type: Number,
        required: true
    },
    vendorRegisteredList: {
        type: [String]
    },
    bazzarDate: {
        type: String,
        required: true
    },
    bazzarDescription: {
        type: String,
        required: true
    },
    bazzarCity: {
        type: String,
        required: true
    }
})

const WeeklyBazzar = mongoose.model("WeeklyBazzar", weeklyBazzarDetails);
module.exports = WeeklyBazzar;