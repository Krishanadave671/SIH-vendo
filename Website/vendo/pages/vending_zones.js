import axios from "axios";
import React from "react";
import { Button } from "react-bootstrap";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import Accordion from "react-bootstrap/Accordion";
import CommonInput from "../pages/components/CommonInput";
import Router, { useRouter } from 'next/router'
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  Autocomplete,
} from "@react-google-maps/api";
import Geocode, { setApiKey } from "react-geocode";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTrashCan } from "@fortawesome/free-solid-svg-icons";

export default function dashboard({ VendingZones }) {
  
  const [address, setAddress] = React.useState("");
  var location_tax = 0;
  var maximum_capacity = 0;
  var ctg_not_allowed = [];
  var img_url = "";
  var desc = "";
  
  const containerStyle = {
    // width: '800px',
    height: "400px",
    marginTop: "20px",
  };
  
  const [center, setCenter] = React.useState({
    lat: 19.076,
    lng: 72.8777,
  });
  
  const [position, setPosition] = React.useState({
    lat: 37.772,
    lng: -122.214,
  });






  var submitvendorzone = async () => {
    const res = await axios.post(
      "http://localhost:4000/api/addvendingzones",
      {
        "vendingzonestreetName" : address , 
        "vendingzonelocation" : "https://goo.gl/maps/fcPz9kC7eApJ7ymz8" , 
        "vendingzonedescription" : "Hello world how are you ? " , 
        "maximumVendorsallowed" : 7 , 
        "vendingzonecity" : "Jaipur", 
        "vendingzoneward" : "ward-3", 
        "vendingzonelocationtax" : 100 ,
        "vendingzoneAddress" : "Maharaj bhavan  , near jogeshwari caves , Dadar (east) Mumbai - 400060" , 
        "categoryofvendorsNotAllowed" : [
            "Foodvendor" , "vegetablevendor"
        ]
      }
    ).then((response)=>{
      console.log("Uploaded successfully");
      Router.push("/vending_zones");

    })
    
  }


  Geocode.setApiKey("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw");
  Geocode.enableDebug();

  const SearchBar = () => {
    return (
      <div className="vendor-registration-search-bar">
        <div className="vendor-registration-search-bar-items">
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Control
              type="text"
              placeholder="Enter city"
              onChange={(text) => {
                city = text.target.value;
              }}
            />
          </Form.Group>
          {/* <FormComponent state={city} setState={changeCity} label="Enter City" /> */}
        </div>
        <div className="vendor-registration-search-bar-items">
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Control
              type="locality"
              placeholder="Enter ward number"
              onChange={(text) => {
                locality = text.target.value;
              }}
            />
          </Form.Group>
        </div>
        <div className="vendor-registration-search-bar-items">
          <Button
            variant="primary"
            onClick={() => {
              console.log(city);
              console.log(locality);
              changeCity(city);
              changeLocality(locality);
            }}
          >
            Search
          </Button>{" "}
        </div>
      </div>
    );
  };

  console.log(VendingZones);
  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="vending-zone-main-container">
        <div className="add-vending-zones">
          <Accordion defaultActiveKey="0">
            <Accordion.Item eventKey="0">
              <Accordion.Header>
                <div className="pending-application-section-title">
                  Add vending zone
                </div>
              </Accordion.Header>
              <Accordion.Body>
                <CommonInput placeholderText="Enter vending zone location tax" onChange={(e)=>{
                  location_tax = e.target.value;
                }}/>
                <CommonInput placeholderText="Enter vending zone ward number" onChange={(e)=>{

                }}/>
                <CommonInput placeholderText="Enter maximum capacity of vendors" onChange={(e)=>{
                  maximum_capacity = e.target.value;
                }}/>
                <LoadScript
                  googleMapsApiKey="AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"
                  libraries={["places"]}
                >
                  <GoogleMap
                    id="marker-example"
                    mapContainerStyle={containerStyle}
                    center={center}
                    zoom={16}
                    onClick={(e) => {
                      setPosition({ lat: e.latLng.lat(), lng: e.latLng.lng() });
                      Geocode.fromLatLng(
                        position.lat.toString(),
                        position.lng.toString()
                      ).then(
                        (response) => {
                          console.log(response.results[0].formatted_address);
                          setAddress(response.results[0].formatted_address);
                        },
                        (error) => {
                          console.log(error);
                        }
                      );
                    }}
                  >
                    <Autocomplete
                    // onLoad={this.onLoad}
                    // onPlaceChanged={this.onPlaceChanged}
                    >
                      <input
                        type="text"
                        placeholder="Enter zone address"
                        onChange={(e) => {
                          Geocode.fromAddress(e.target.value).then(
                            (response) => {
                              const { lat, lng } =
                                response.results[0].geometry.location;
                              setPosition({ lat: lat, lng: lng });
                              setCenter({ lat: lat, lng: lng });
                            },
                            (error) => {
                              console.log(error);
                            }
                          );
                          setAddress(e.target.value);
                        }}
                        style={{
                          boxSizing: `border-box`,
                          border: `1px solid var(--primary-color-dark)`,
                          width: `256px`,
                          height: `64px`,
                          padding: `1rem 2rem`,
                          borderRadius: `0.9rem`,
                          boxShadow: `0 2px 6px rgba(0, 0, 0, 0.3)`,
                          fontSize: `1rem`,
                          outline: `none`,
                          textOverflow: `ellipses`,
                          position: "absolute",
                          left: "50%",
                          marginLeft: "-120px",
                        }}
                      />
                    </Autocomplete>
                    <MarkerF
                      // onLoad={onLoad}
                      position={position}
                    />
                    {/* Child components, such as markers, info windows, etc. */}
                    {/* <></> */}
                    <MarkerF />
                  </GoogleMap>
                </LoadScript>
                <div
                style={{
                  marginTop:"20px",
                  fontWeight:"normal",
                  fontSize:"1.2rem"
                }}
                >
                  Selected address - 
                  {address} 
                </div>
                <Button style={{ marginTop: "20px" }}
                onClick={submitvendorzone}
                
                >Submit</Button>
              </Accordion.Body>
            </Accordion.Item>
          </Accordion>
        </div>
        <SearchBar />
        <div className="vendor-zone-list">
          <ul>
            {VendingZones.map((zone) => {
              let url = "/approved_application/" + zone.vendingzoneid;
              return (
                <li>
                  <Card key={zone.vendingzoneid}>
                    <Card.Body>
                      <Card.Title>
                        <div className="pending-application-section-title">
                          <a href={url}>Zone id - {zone.vendingzoneid}</a>
                        </div>
                        <div className="pending-application-section-title">
                          {zone.vendingzonestreetName}
                        </div>
                      </Card.Title>
                      <Card.Subtitle className="mb-2 text-muted">
                        <div className="pending-application-section-desc">
                          {zone.vendingzonecity}
                        </div>
                        {zone.vendingzonedescription}
                        {/* <div>{reviews.custom_officer_date}</div> */}
                      </Card.Subtitle>
                      <Card.Text>{zone.vendingzoneward}</Card.Text>
                      {/* <Card.Link href={``}>Card Link</Card.Link> */}
                      <Card.Link href="#" style={{ color: "red" }}>
                        <FontAwesomeIcon icon={faTrashCan} size="1x" /> Delete
                      </Card.Link>
                    </Card.Body>
                  </Card>
                </li>
              );
            })}
          </ul>
        </div>
      </div>
    </div>
  );
}

export async function getServerSideProps(context) {
  const res = await axios.get(
    "http://localhost:4000/api/getvendingzones/search"
  );
  // console.log(res);
  const data = await JSON.parse(JSON.stringify(res.data));
  return {
    props: {
      VendingZones: data,
    },
  };
}
