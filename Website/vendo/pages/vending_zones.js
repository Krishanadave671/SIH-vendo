import axios from "axios";
import React, { useEffect } from "react";
import { Button } from "react-bootstrap";
import DashboardSidebar from "./components/DashboardSidebar";
import { storage } from './firebase';
import { ref, getDownloadURL, uploadBytesResumable } from "firebase/storage";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import Accordion from "react-bootstrap/Accordion";
import CommonInput from "../pages/components/CommonInput";
import Router, { useRouter } from 'next/router';
import Highlighter from "./components/Highlighter";
import FloatingLabel from 'react-bootstrap/FloatingLabel';
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

  /*
  @Params 
  vendingZoneID
  vendingZoneLocality
  vendingZoneLat
  vendingZoneLong
  vendingZoneDescription
  vendingZoneImageURL
  maximumVendorsAllowed
  vendingZoneCity
  vendingZoneWard
  vendingZoneLocationFee
  vendingZoneAddress
  categoryOfVendorsNotAllowed
  vendorTypeFavourables
  vendorIDList
  */ 
  const [vendorZoneList,setvendorZoneList] = React.useState(VendingZones);
  const [address, setAddress] = React.useState("");
  const [vendingZoneLat, setvendingZoneLat] = React.useState(0);
  const [vendingZoneLong, setvendingZoneLong] = React.useState(0);
  const [vendingZoneLocality,setvendingZoneLocality] = React.useState("");
  const [vendingZoneDescription,setvendingZoneDescription] = React.useState("");
  const [maximumVendorsAllowed,setmaximumVendorsAllowed] = React.useState(0);
  const [vendingZoneCity, setvendingZoneCity] = React.useState("");
  const [vendingZoneWard, setvendingZoneWard] = React.useState("");
  const [vendingZoneLocationFee, setvendingZoneLocationFee] = React.useState(0);
  var vendingZoneAddress = address;
  const [categoryOfVendorsNotAllowed, setcategoryOfVendorsNotAllowed] = React.useState([0,0,0,0,0,0]);
  const [vendorTypeFavourables, setvendorTypeFavourables] = React.useState([0,0,0,0,0,0]);
  var file;
  
  
  // Map params
  const containerStyle = {
    // width: '800px',
    height: "400px",
    marginTop: "20px",
  };
  
  const [center, setCenter] = React.useState({
    lat: 19.076,
    lng: 72.8777,
  });
  const [vendingZoneImageURL,setVendorZoneImageURL] = React.useState("");
  
  const [position, setPosition] = React.useState({
    lat: 37.772,
    lng: -122.214,
  });
  Geocode.setApiKey("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw");
  Geocode.enableDebug();



  var submitvendorzone = async () => {
    console.log(vendingZoneLocality);
    console.log(vendingZoneLat);
    console.log(vendingZoneLong);
    console.log(vendingZoneDescription);
    console.log(vendingZoneImageURL);
    console.log(maximumVendorsAllowed);
    console.log(vendingZoneCity);
    console.log(vendingZoneWard);
    console.log(vendingZoneLocationFee);
    console.log(vendingZoneAddress);
    console.log(categoryOfVendorsNotAllowed);
    console.log(vendorTypeFavourables);
    var notfavList = [];
    for(var i = 0; i < 6; i++){
      if(categoryOfVendorsNotAllowed[i]==1){
        notfavList.push(getType(i));
      }
    }
    // const res = await axios.post(
    //   "http://localhost:4000/api/addvendingzones",
    //   {
    //     "vendingzonestreetName" : address , 
    //     "vendingzonelocation" : "https://goo.gl/maps/fcPz9kC7eApJ7ymz8" , 
    //     "vendingzonedescription" : vendingZoneDescription, 
    //     "maximumVendorsallowed" : maximumVendorsAllowed , 
    //     "vendingzonecity" : vendingZoneCity, 
    //     "vendingzoneward" : vendingZoneWard, 
    //     "vendingzonelocationtax" : vendingZoneLocationFee ,
    //     "vendingzoneAddress" : vendingZoneAddress , 
    //     "categoryofvendorsNotAllowed" : notfavList,
    //   }
    // ).then((response)=>{
    //   console.log("Uploaded successfully");
    //   Router.push("/vending_zones");

    // })
    
  }

  // Upload image
  const UploadImage = () =>{
    if (!file) {
      alert("Please upload an image first!");
    }
    const d = new Date();
    let time = d.getTime();
    const storageRef = ref(storage, `/vendor_zone/${time.toString()}`);
    const uploadTask = uploadBytesResumable(storageRef, file);
    uploadTask.on(
        "state_changed",
        (snapshot) => {
            const percent = Math.round(
                (snapshot.bytesTransferred / snapshot.totalBytes) * 100
            );
            // update progress
            // setPercent(percent);
        },
        (err) => console.log(err),
        () => {
            // download url
            getDownloadURL(uploadTask.snapshot.ref).then((url) => {
                console.log(url);
                // vendingZoneImageURL = url;
                setVendorZoneImageURL(url);
                
            });
        }
    );
  }

  const findIdx = (s) =>{
    if(s == "Foods and vegetables"){
      return 0;
    }
    if(s == "Fast Food Veg"){
      return 1;
    }
    if(s == "Fast Food Non-veg"){
      return 2;
    }
    if(s == "Toys"){
      return 3;
    }
    if(s == "Utensils"){
      return 4;
    }
    if(s == "Flowers"){
      return 5;
    }
  }
  const getType = (s) =>{
    if(s == 0){
      return "Foods and vegetables";
    }
    if(s == 1){
      return "Fast Food Veg";
    }
    if(s == 2){
      return "Fast Food Non-veg";
    }
    if(s == 3){
      return "Toys";
    }
    if(s == 4){
      return "Utensils";
    }
      return "Flowers";
  }

  // Search bar 
  const [searchCity, setsearchCity] = React.useState("");
  const [searchTax, setsearchTax] = React.useState("");
  const [searchLocality, setsearchLocality] = React.useState("");
  const [searchVendorCategory, setsearchVendorCategory] = React.useState("");
  const SearchBar = () => {
    return (
      <div className="vendor-registration-search-bar">
        <div className="vendor-registration-search-bar-items">
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Control
              type="text"
              placeholder="Enter city"
              onChange={(e) => {
                setsearchCity(e.target.value);
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
              onChange={(e) => {
                setsearchLocality(e.target.value);
              }}
            />
          </Form.Group>
        </div>
        <div className="vendor-registration-search-bar-items">
          <Button
            variant="primary"
            onClick={() => {
              axios.get(
                "http://localhost:4000/api/getvendingzones/search"
              ).then((res)=>{
                 JSON.parse(JSON.stringify(res.data)).then((data)=>{})

              })
              // console.log(res);
            }}
          >
            Search
          </Button>{" "}
        </div>
      </div>
    );
  };

  // Main Body 
  console.log(VendingZones);
  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="vending-zone-main-container">
        <div className="add-vending-zones">
          <Accordion defaultActiveKey="1">
            <Accordion.Item eventKey="0">
              <Accordion.Header>
                <div className="pending-application-section-title">
                  Add vending zone
                </div>
              </Accordion.Header>
              <Accordion.Body>
                <CommonInput placeholderText="Enter vending zone location Fee" onChange={(e)=>{
                  setvendingZoneLocationFee(parseInt(e.target.value));
                }}/>
                <CommonInput placeholderText="Enter vending zone ward number" onChange={(e)=>{
                  setvendingZoneWard(e.target.value);
                }}/>
                <CommonInput placeholderText="Enter maximum capacity of vendors" onChange={(e)=>{
                  setmaximumVendorsAllowed(parseInt(e.target.value));
                }}/>
                <FloatingLabel controlId="floatingTextarea2" label="Enter description of vending zone"
                 
                >
                  <Form.Control
                    as="textarea"
                    placeholder="Enter description of vending zone"
                    style={{ height: '100px',borderRadius:"0.9rem",marginTop:"10px",marginBottom:"10px"}}
                    onChange={(e)=>{
                      setvendingZoneDescription(e.target.value);
                      console.log(vendingZoneDescription);
                    }}
                  />
                </FloatingLabel>
                <div>
                    <input type="file" onChange={(e)=>{
                      file = e.target.files[0];
                    }} accept="/image/*" />
                    <button onClick={UploadImage}>Upload to Firebase</button>
                    <p> "% done"</p>
                </div>
                <img src={vendingZoneImageURL} alt="" width={"600px"} />
                
                <Highlighter Text="Select favourable vendor categories" fontSize="1.2rem"/>
                <Form>
                  {['Foods and vegetables', 'Fast Food Veg','Fast Food Non-veg','Toys','Utensils','Flowers'].map((type) => (
                    <div key={`${type}`} className="mb-3">
                      <Form.Check 
                        type={"checkbox"}
                        id={`${type}`}
                        label={`${type}`}
                        
                        onChange={(e)=>{
                          // console.log(e.target.value);
                          var tmpvendorTypeFavourables = vendorTypeFavourables;

                          console.log(findIdx(e.target.id));
                          tmpvendorTypeFavourables[findIdx(e.target.id)] ^=1;
                          setvendorTypeFavourables(tmpvendorTypeFavourables);
                        }}
                        value="1"
                        />
                    </div>
                  ))}
                </Form>
                <Highlighter Text="Select prohibited type of vendors" fontSize="1.2rem"/>
                <Form>
                  {['Foods and vegetables', 'Fast Food Veg','Fast Food Non-veg','Toys','Utensils','Flowers'].map((type) => (
                    <div key={`${type}`} className="mb-3">
                      <Form.Check 
                        type={"checkbox"}
                        id={`${type}`}
                        label={`${type}`}

                        onChange={(e)=>{
                          var tmpcategoryOfVendorsNotAllowed = categoryOfVendorsNotAllowed;
                          tmpcategoryOfVendorsNotAllowed[findIdx(e.target.id)] ^=1;
                          setcategoryOfVendorsNotAllowed(tmpcategoryOfVendorsNotAllowed);
                        }}
                        // value="1"
                      />
                    </div>
                  ))}
                </Form>
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
                      
                      setvendingZoneLat(e.latLng.lat());
                      setvendingZoneLong(e.latLng.lng());
                      setPosition({ lat: e.latLng.lat(), lng: e.latLng.lng() });
                      Geocode.fromLatLng(
                        position.lat.toString(),
                        position.lng.toString()
                      ).then(
                        (response) => {
                          var tmpvendingZoneLocality = "";
                          for (let i = 0; i < response.results[0].address_components.length; i++) {
                            for (let j = 0; j < response.results[0].address_components[i].types.length; j++) {
                              switch (response.results[0].address_components[i].types[j]) {
                                case "locality":
                                  setvendingZoneCity(response.results[0].address_components[i].long_name);
                                  break;
                                case "sublocality":
                                  tmpvendingZoneLocality +=  response.results[0].address_components[i].long_name + " ";
                                  break;
                              }
                            }
                          }
                          setvendingZoneLocality(tmpvendingZoneLocality);
                          console.log(response.results[0].formatted_address);
                          console.log(vendingZoneLocality);
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
                                setvendingZoneLat(lat);
                                setvendingZoneLong(lng);
                                console.log(response.results[0]);
                                var tmpvendingZoneLocality = "";
                          for (let i = 0; i < response.results[0].address_components.length; i++) {
                            for (let j = 0; j < response.results[0].address_components[i].types.length; j++) {
                              switch (response.results[0].address_components[i].types[j]) {
                                case "locality":
                                  setvendingZoneCity(response.results[0].address_components[i].long_name);
                                  break;
                                  case "sublocality":
                                    tmpvendingZoneLocality +=  response.results[0].address_components[i].long_name + " ";
                                    break;
                                  }
                                }
                              }
                              console.log(response.results[0].formatted_address);
                          setvendingZoneLocality(tmpvendingZoneLocality);
                          console.log(vendingZoneLocality);
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
            {vendorZoneList.map((zone) => {
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