const express = require('express'); 
const complaintsrouter = express.Router(); 
const Complaints = require("../models/complaints");
const Vendor = require("../models/vendor_details");

//add complaint
complaintsrouter.post("/api/addcomplaint", async (req, res) =>{
    try{
        const {vendorid, complaintid, complaintdate, complaintstatus, complainttype, imageurl, complaintdescription} = req.body;
        let vendor = await Vendor.findOne({ vendorid });
        let complaint = new Complaints({
            complaintid, complaintdate, complaintstatus, complainttype, imageurl, complaintdescription
        });
        vendor.complaints.push(complaint);
        vendor = await vendor.save();
        complaint = await complaint.save();
        res.status(200).json(complaint);
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})

// fetch all complaints 
complaintsrouter.get("/api/getcomplaints/all" , async (req, res) =>  { 
    try {
        let complaints = await Complaints.find({}); 
        res.status(200).json(complaints); 
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})

//get complaints by location
complaintsrouter.get("/api/getcomplaints/:location", async(req, res) => {
    try{
        const {location} = req.params;
        let vendor = await Vendor.find({shoplocation: location}).select('complaints'); 
        res.status(200).json(vendor); 
    }catch(e) {
        res.status(500).json({e : e.message}); 
    }
})

module.exports = complaintsrouter; 