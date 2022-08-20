const express = require('express');
const bazzarsrouter = express.Router(); 
const Bazzars = require("../models/weeklybazzar");

// add bazzar
bazzarsrouter.post("/api/addbazzar", async (req, res) => {
    try{
        const {bazzarId,vendorTypeFavourable,  bazzarName, bazzarDescription, bazzarDate ,bazzarAddress , bazzarMaximumCapacity, bazzarImageUrl, bazzarLat, bazzarLong, bazzarCity} = req.body;
        let bazzar = new Bazzars({
            bazzarId, bazzarName, bazzarDescription, bazzarImageUrl, bazzarLat, bazzarLong, bazzarCity, 
            bazzarDate ,bazzarAddress , bazzarMaximumCapacity,  vendorTypeFavourable
        });
        bazzar = await bazzar.save();
        res.status(200).json(bazzar);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

//get bazaars by city and bazzarDate 
bazzarsrouter.post("/api/getbazzarsbycityandDate", async (req, res) => {
    try {
        const {city, bazzarDate} = req.body;
        let bazzars = await Bazzars.find({bazzarCity: city, bazzarDate: bazzarDate});
        res.status(200).json(bazzars);
    }catch(e){
        res.status(500).json({e : e.message});
    }
} );

// get bazzar by bazzarId
bazzarsrouter.get("/api/getbazzar/:bazzarId", async (req, res) => {
    try {
        const {bazzarId} = req.params;
        let bazzar = await Bazzars.find({bazzarId: bazzarId});
        res.status(200).json(bazzar);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});



module.exports = bazzarsrouter ; 
