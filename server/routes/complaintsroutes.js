const express = require('express'); 
const complaintsrouter = express.Router(); 
const Complaints = require("../models/complaints");
const Vendor = require("../models/vendor_details");

//add complaint
complaintsrouter.post("/api/addcomplaint", async (req, res) =>{
    try{
        const {vendorId, complaintId, complaintDate, complaintStatus, complaintType, complaintImageUrl, complaintDescription, complaintLocationLat, complaintLocationLong, complaintCity} = req.body;
        let vendor = await Vendor.findOne({ vendorId });
        let complaint = new Complaints({
           vendorId , complaintId, complaintDate, complaintStatus, complaintType, complaintImageUrl, complaintDescription, complaintLocationLat, complaintLocationLong, complaintCity
        });
         console.log(complaint); 
        complaint = await complaint.save();
        console.log(complaint); 
        vendor.complaintsList.push(complaint);
        vendor = await vendor.save();
        res.status(200).json(complaint);
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})


// resolve complaints 
// reject complaints 


//get complaints by lo// fetch all complaints 
complaintsrouter.get("/api/getcomplaints/all" , async (req, res) =>  { 
    try {

        let complaints = await Complaints.find({complaintStatus:"pending"}); 
        res.status(200).json(complaints); 
    }catch(e){
        res.status(500).json({e : e.message}); 
    }
})
complaintsrouter.get("/api/getcomplaints/:city", async(req, res) => {
    try{
        const {city} = req.params;
        let complaints = await Complaints.find({complaintCity : city }); 
        res.status(200).json(complaints); 
    }catch(e) {
        res.status(500).json({e : e.message}); 
    }
})
complaintsrouter.get("/api/getcomplaints/:city/:tags", async(req, res) => {
    try{
        const {city, tags} = req.params;
        let complaints = await Complaints.find({complaintCity : city , complaintType : {$in : tags} }); 
        res.status(200).json(complaints); 
    }catch(e) {
        res.status(500).json({e : e.message}); 
    }
})

// get all pending complaints
complaintsrouter.get("/api/getpendingcomplaints" , async (req, res) =>  {
    try {
        let complaints = await Complaints.find({complaintStatus : "pending"})
        res.status(200).json(complaints);
    }catch(e){
        res.status(500).json({e : e.message});
    }
} ); 
// get complaints by id 
complaintsrouter.get("/api/getcomplaintsbyid/:id" , async (req, res) =>  {
    try {
        const {id} = req.params ;
        let complaint = await Complaints.find({complaintId: id});
        res.status(200).json(complaint);
    }catch(e){
        res.status(500).json({e : e.message});
    }

} );


complaintsrouter.get("/api/getpendingcomplaints/:city/:tags/:status", async(req, res) => {
    try{
        const {city, tags, status} = req.params;
        let complaints = await Complaints.find({complaintCity : city , complaintType : {$in : tags}, complaintStatus : status }); 
        res.status(200).json(complaints); 
    }catch(e) {
        res.status(500).json({e : e.message});
    }
} )

module.exports = complaintsrouter; 

