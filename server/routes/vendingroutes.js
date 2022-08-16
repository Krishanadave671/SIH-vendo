const express = require('express'); 
const vendingzonerouter = express.Router(); 
const { vendingzones } = require("../models/vendingzones"); 
const Vendor = require("../models/vendor_details");
// find vendingzones according to location search bar for vendors app
vendingzonerouter.get("/api/getvendingzones/search/:city/:tax/:vendorcategory"  , async (req , res) => { 
    try {
        const { city,tax ,vendorcategory  } = req.params ; 
        let vendingzone = await vendingzones.find({
            vendingzonecity : city , 
            vendingzonelocationtax : { $lte : tax}, 
            categoryofvendorsNotAllowed : { $nin : vendorcategory} 
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
         const {vendingzonecity} = vendingZone; 
         vendingZone.vendingzoneid = vendingzonecity.substring(0, 3) + Date.now().toString().substring(0,4) ; 
         vendingZone = await vendingZone.save(); 
         res.json(vendingZone.json); 
    }catch (error){
        res.status(500).json({ error: error.message });
        console.log(error); 
    }
    
}); 

module.exports = vendingzonerouter; 
