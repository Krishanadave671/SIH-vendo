const express = require('express'); 
const vendingzonerouter = express.Router(); 
const { vendingzones } = require("../models/vendingzones"); 

// find vendingzones according to location search bar for vendors app
vendingzonerouter.get("/api/getvendingzones/search/:city/:ward/:tax" , async (req , res) => { 
    try {
        const { city , ward , tax} = req.params ; 
    
        let vendingzone = await vendingzones.find({
            vendingzonecity : city , 
            vendingzoneward : ward , 
            locationtax : { $lt : tax}, 
        }); 
        res.status(200).json(vendingzone); 
    }catch(e) {
        res.status(500).json({e : e.message}); 
    }
})

// find all vendingzones.. 
vendingzonerouter.get("/api/getvendingzones/search" , async (req, res) =>  { 
    try {
        let vendingzone = await vendingzones.find({}); 
        res.status(200).json(vendingzone); 
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})


// post request to add vendingzones in location 
vendingzonerouter.post("/api/addvendingzones", async (req, res) => {

    try{ 
         let vendingZone = new vendingzones(req.body); 
         vendingZone = await vendingZone.save(); 
         res.json(vendingZone.json); 

    }catch (error){
        res.status(500).json({ error: error.message });
        console.log(error); 
    }
    
}); 

module.exports = vendingzonerouter; 
