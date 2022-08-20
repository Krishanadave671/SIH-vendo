const mongoose = require("mongoose");

const schemeSchema = new mongoose.Schema({
    schemeId: {
        type: Number,
        trim: true,
        unique: true
    },
    schemeName: {
        type: String,
        required: true,
        trim: true
    },
    schemeDescription: {
        type: String,
        required: true,
        trim: true
    },
    schemeImageUrl: {
        type: String,
        default: "https://lh5.googleusercontent.com/p/AF1QipM8YeTMOC9DfdD7GmXMnGN9OuG9MrQYOn24eHta=w408-h306-k-no"
    }
});

const Schemes = mongoose.model("Schemes", schemeSchema);
module.exports = Schemes;
