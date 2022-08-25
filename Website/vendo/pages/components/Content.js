import React from "react";
import styles from "../../styles/Home.module.css";
import { Line } from "react-chartjs-2";
import { Doughnut } from "react-chartjs-2";
import Chart from "chart.js/auto";
import { CategoryScale } from "chart.js";
import {
   GoogleMap,
   LoadScript,
   MarkerF,
   InfoWindowF,
 } from "@react-google-maps/api";
 import CommonInput from "./CommonInput";
 import { Button } from "react-bootstrap";
Chart.register(CategoryScale);

const data = {
  labels: ["Registered Vendors", "Approved Vendors", "Rejected Vendors"],
  datasets: [
    {
      data: [15, 80, 5],
      backgroundColor: ["#7393B3", "#36A2EB", "#FFCE56"],
      hoverBackgroundColor: ["#CCCCFF", "#7393B3", "#191970"],
    },
  ],
};

const containerStyle = {
   width: '95%',
   height: "400px",
   marginTop: "20px",
   marginLeft: "30px",
   marginBottom:"60px"
}
 
 const center = {
   lat: 19.076,
   lng: 72.8777,
 };
 
 const position = {
   lat: 37.772,
   lng: -122.214,
 };
 const position1 = {
   lat: 37.782,
   lng: -122.214,
 };
 const position2 = {
   lat: 37.772,
   lng: -122.224,
 };
 const position3 = {
   lat: 37.782,
   lng: -122.224,
 };
 //doughnut chart data set
 
//doughnut chart data set

const data1 = {
  labels: ["Pending", "Verified", "New"],
  datasets: [
    {
      data: [300, 50, 100],
      backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
      hoverBackgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
    },
  ],
};

function Content() {
  return (
    <div className="ContentContainer">
      <section className="ScrollText">
        <p>
          Vendos is an initiative to implement smart city planning and provide
          multiple benefits to vendors and street hawkers. We hope you find this
          platform helpful and make the best use of it!
        </p>
      </section>
      <div className="ContentWrapper">
        <div className="Tabs">
          <div className="Categories">
            <h2>Vendors under me</h2>
          </div>
        </div>

        <div className="Tabs">
          <div className="Categories">
            <h2>Zones under me</h2>
          </div>
        </div>

        <div className="Tabs">
          <div className="Categories">
            <h2>Active Schemes</h2>
          </div>
        </div>

        <div className="Tabs">
          <div className="Categories">
            <h2>Pending Approvals</h2>
          </div>
        </div>
      </div>

      {/* chart js started */}

      <div className="charts">
        <div className="circle1">
          <h2>Vendor Data</h2>
          <Doughnut data={data} width={400} height={400}></Doughnut>
        </div>
        <div className="circle">
          <h2>Vending Zone</h2>
          <Doughnut data={data1} width={400} height={400}></Doughnut>
        </div>
      </div>
      <div style={{display:"flex", width:"100%",textAlign:"center"}}>
         <div style={{whiteSpace:"nowrap",fontSize:"1.6rem", margin:"20px"}}>Enter location</div>
         <CommonInput placeholderText="Enter location (default jaipur)" />
         <Button style={{
          textShadow: "0px 0px 10px rgba(0,0,0,0.2)",
          boxShadow: "0 0 20px rgb(109, 105, 105)",
          borderRadius: "10px",
          backgroundImage: "linear-gradient(to right, #334768 0%, #5b889d 51%, #242d3c 100%)",
            height:"50px",
            
            margin:"20px"
         }}> Search </Button>
      </div>
      <LoadScript
        googleMapsApiKey="AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"
        libraries={["places"]}
      >
        <GoogleMap
  
          id="marker-example"
          mapContainerStyle={containerStyle}
          center={position}
          zoom={16}
        >
          {/* <MarkerF position={position} />
          <MarkerF position={position1} />
          <MarkerF position={position2} />
          <MarkerF position={position3} /> */}
          <InfoWindowF position={position}>
            <div >
               <a href="/approved_application/VX065">
                  Kirti college ka vadapav link wala
               </a>
            </div>
          </InfoWindowF>
          <InfoWindowF position={position1}>
            <div >
               Kirti college ka vadapav
            </div>
          </InfoWindowF>
          <InfoWindowF position={position2}>
            <div>
               Kirti college ka vadapav
            </div>
          </InfoWindowF>
          <InfoWindowF position={position3}>
            <div>
               Kirti college ka vadapav
            </div>
          </InfoWindowF>
        </GoogleMap>
      </LoadScript>
    </div>
  );

}

export default Content;
