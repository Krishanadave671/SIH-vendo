const express = require('express');
const govermentrouter = express.Router();
const bcryptjs = require('bcryptjs');
const Goverment = require('../models/goverment');


govermentrouter.post('/api/govermentlogin', async (req, res) => {
    try {
        const { username, password } = req.body;
        const goverment = await Goverment.findOne({ username});
        if (!goverment) {
            return res
                .status(400)
                .json({ msg: "User with this Goverment Id does not exist!" });
        }

        const isMatch = await bcryptjs.compare(password, goverment.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });
        }
        res.json({ ...goverment._doc });
    } catch (e) {
        res.status(500).json({ e: e.message });
    }}  
);

govermentrouter.post('/api/govermentregister', async (req, res) => {

    try {
        const {username , password}  =  req.body ; 
        const existingGoverment = await Goverment.findOne({ username : username });
        if (existingGoverment) {
            return res
                .status(400)
                .json({ msg: "Goverment with same username exists ! " });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let goverment = new Goverment({...req.body , password : hashedPassword});
        goverment = await goverment.save();
         return res.status(200).json(goverment);
    }catch (e) {
        res.status(500).json({ error: e.message });
    }
    
});

module.exports = govermentrouter;
