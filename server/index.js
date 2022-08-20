const cors = require('cors');
const express = require('express'); 
const mongoose = require('mongoose'); 
const app = express();
const dotenv = require('dotenv');
dotenv.config(); 
const PORT = process.env.PORT || 4000;
const DB = process.env.MONGO_URI; 
// routers 
const vendingzonerouter = require("./routes/vendingroutes"); 
const vendordetailsrouter = require("./routes/auth");
const complaintsrouter = require("./routes/complaintsroutes");
const schemesRouter = require("./routes/schemes");

// middlewares
app.use(cors()); 
app.use(express.json()); 
app.use(vendingzonerouter);
app.use(vendordetailsrouter);
app.use(complaintsrouter);
app.use(schemesRouter); 
 
mongoose.connect(DB).then( () => {
    console.log("Connection successful "); 
}).catch( (err) => {
    console.log(err); 
    
})
app.get("/", (req, res) => {
    res.send("Hello world "); 
})

// listen to port
app.listen(PORT , "0.0.0.0" , ()=> {
    console.log(`Server is running on port ${PORT}`); 
})

