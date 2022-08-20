const express = require('express');
const schemerouter = express.Router();
const Schemes = require("../models/schemes");
// add scheme
schemerouter.post("/api/addscheme", async (req, res) => {
    try{
        const {schemeId, schemeName, schemeDescription, schemeImageUrl} = req.body;
        let scheme = new Schemes({
            schemeId, schemeName, schemeDescription, schemeImageUrl
        });
        scheme = await scheme.save();
        res.status(200).json(scheme);
    }catch(e){
        res.status(500).json({e : e.message});
    }
}); 
// fetch all schemes
schemerouter.get("/api/getschemes/all" , async (req, res) =>  {
    try {
        let schemes = await Schemes.find({});
        res.status(200).json(schemes);
    }catch(e){
        res.status(500).json({e : e.message});
    }
});

schemerouter.get("/api/getschemeid", async (req, res)   => {
    try {
            let schemes = await Schemes.find({});   
            let schemeId = schemes.length + 1;
            res.status(200).json(schemeId);
    }catch(e){
        res.status(500).json(e.message);
    }
});





module.exports = schemerouter;