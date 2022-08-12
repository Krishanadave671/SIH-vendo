const express = require('express'); 
const Vendor = require("../models/vendor_details");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

//Sign Up
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, address, }
    }
})