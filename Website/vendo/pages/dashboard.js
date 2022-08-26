import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Header from "./components/Header";
// import Content from "./components/Content.js";
import { Doughnut } from "react-chartjs-2";
import Chart from "chart.js/auto";
import { CategoryScale } from "chart.js";
import CommonInput from "./components/CommonInput";
import { Button } from "react-bootstrap";
import Link from "next/link";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  InfoWindowF,
} from "@react-google-maps/api";
import Carousel from "react-bootstrap/Carousel";

export default function dashboard() {
  const [card, setcard] = React.useState([0,0,0,0]);
  const [index, setIndex] = React.useState(0);
  const handleSelect = (selectedIndex, e) => {
    setIndex(selectedIndex);
  };
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
            multiple benefits to vendors and street hawkers. We hope you find
            this platform helpful and make the best use of it!
          </p>
        </section>
        <div className="ContentWrapper">
          <Link href="/dashboard">
            <div className="Tabs"
              onClick={(e)=>{
                card[0]^=1;
                setcard(card);
                console.log("Clicked");
                console.log(card);
              }}
            >
              <div className="Categories">
                <h2>{card[0]==0? "Vendors under me":"No of vendors managed - 8400k. \n Total approved vendor - 30k"} </h2>
              </div>
            </div>
          </Link>
          <Link href="/dashboard">
            <div className="Tabs"
              onClick={(e)=>{
                card[1]^=1;
                setcard(card);
                console.log("Clicked");
                console.log(card);
              }}
            >
              <div className="Categories">
                <h2>{card[1]==0? "Zones under me":"No of vendor area under me - 12  \n Total area - 30 sq km"} </h2>
              </div>
            </div>
          </Link>
          <Link href="/dashboard">
            <div className="Tabs"
              onClick={(e)=>{
                card[2]^=1;
                setcard(card);
                console.log("Clicked");
                console.log(card);
              }}
            >
              <div className="Categories">
                <h2>{card[2]==0? "Active Schema":"Total active schemas - 12  \n Most popular scheme - PMSBY"} </h2>
              </div>
            </div>
          </Link>

          <Link href="/dashboard">
            <div className="Tabs"
              onClick={(e)=>{
                card[3]^=1;
                setcard(card);
                console.log("Clicked");
                console.log(card);
              }}
            >
              <div className="Categories">
                <h2>{card[3]==0? "Pending Registration":"120 pending registration  \n"} </h2>
              </div>
            </div>
          </Link>

          
        </div>
        <div style={{width:"100%",textAlign:"center"}}>

          <Carousel activeIndex={index} onSelect={handleSelect}>
            <Carousel.Item>
              <img
                // className="d-block w-100"
                src="https://pmjay.gov.in/sites/default/files/2019-01/Launch-hoarding-2X1_CTC-02_0.jpg"
                alt="First slide"
                height={600}
                />
              <Carousel.Caption>
                {/* <h3>First slide label</h3>
                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p> */}
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
              <img
                // className="d-block w-100"
                src="https://images.citizenmatters.in/wp-content/uploads/sites/18/2019/12/29181707/Workshop-on-Street-Vendors-Act.png"
                alt="First slide"
                height={600}
                />

              <Carousel.Caption>
                {/* <h3>Second slide label</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> */}
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
              <img
                // className="d-block w-100"
                src="https://pmjay.gov.in/sites/default/files/2019-01/Launch-hoarding-2X1_CTC-02_0.jpg"
                height={800}
                // src="holder.js/800x400?text=Third slide&bg=20232a"
                alt="Third slide"
              />

              <Carousel.Caption>
                  {/* <h3>Third slide label</h3>
                  <p>
                    Praesent commodo cursus magna, vel scelerisque nisl consectetur.
                  </p> */}
              </Carousel.Caption>
            </Carousel.Item>
          </Carousel>
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
        <div style={{ display: "flex", width: "100%", textAlign: "center" }}>
          <div
            style={{ whiteSpace: "nowrap", fontSize: "1.6rem", margin: "20px" }}
          >
            Enter location
          </div>
          <CommonInput placeholderText="Enter location (default jaipur)" />
          <Button
            style={{
              textShadow: "0px 0px 10px rgba(0,0,0,0.2)",
              boxShadow: "0 0 20px rgb(109, 105, 105)",
              borderRadius: "10px",
              backgroundImage:
                "linear-gradient(to right, #334768 0%, #5b889d 51%, #242d3c 100%)",
              height: "50px",

              margin: "20px",
            }}
          >
            {" "}
            Search{" "}
          </Button>
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
              <div>
                <a href="/approved_application/VX065">
                  Kirti college ka vadapav link wala
                </a>
              </div>
            </InfoWindowF>
            <InfoWindowF position={position1}>
              <div>Kirti college ka vadapav</div>
            </InfoWindowF>
            <InfoWindowF position={position2}>
              <div>Kirti college ka vadapav</div>
            </InfoWindowF>
            <InfoWindowF position={position3}>
              <div>Kirti college ka vadapav</div>
            </InfoWindowF>
          </GoogleMap>
        </LoadScript>
      </div>
    );
  }
  return (
    <div className="DashboardContainer">
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="dashboard-main-container" style={{ marginLeft: 0 }}>
        <Header pageWrapId={"pagewrap1"} outerContainerId={"container1"} />
        <Content pageWrapId={"page-wrap2"} outerContainerId={"container2"} />
      </div>
    </div>
  );
}
