import axios from "axios";
import React from "react";
import Router, { useRouter } from 'next/router';
import { Button } from "react-bootstrap";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import Accordion from "react-bootstrap/Accordion";
import CommonInput from "../pages/components/CommonInput";
import DatePicker from "react-datepicker";
import Highlighter from "./components/Highlighter";
import { storage } from './firebase';
import { ref, getDownloadURL, uploadBytesResumable } from "firebase/storage";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  Autocomplete,
} from "@react-google-maps/api";
import Geocode from "react-geocode";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTrashCan } from "@fortawesome/free-solid-svg-icons";

export default function dashboard({ WeeklyBazaars }) {
  console.log(WeeklyBazaars)
  /**
   * @Params
   * bazzarId
   * vendorTypeFavourable
   * bazzarImageUrl
   * bazzarLong
   * bazzarLat
   * bazzarName
   * bazzarAddress
   * bazzarMaximumCapacity
   * vendorRegisteredList
   * bazzarDate
   * bazzarDescription
   * bazzarCity
   */

  const [WeeklyBazaarList, setWeeklyBazaarList] = React.useState(WeeklyBazaars);
  const [address,setAddress] =React.useState("");
  const [_vendorTypeFavourables, setvendorTypeFavourable] = React.useState([0,0,0,0,0,0]);
  const [bazaarName, setbazaarName] = React.useState("");
  const [bazaarImageUrl, setbazaarImageUrl] = React.useState("");
  const [bazaarLat, setbazaarLat] = React.useState(0);
  const [bazaarLong, setbazaarLong] = React.useState(0);
  var bazaarAddress = address;
  const [bazaarMaximumCapacity, setbazaarMaximumCapacity] = React.useState(0);
  const [bazaarDate, setbazaarDate] = React.useState("");
  const [bazaarDescription, setbazaarDescription] = React.useState("");
  const [bazaarCity,setbazaarCity] = React.useState("");
  var file;
  Geocode.setApiKey("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw");
  Geocode.enableDebug();
  var uploadData = async () => {
    console.log(address);
    console.log(_vendorTypeFavourables);
    console.log(bazaarName);
    console.log(bazaarImageUrl);
    console.log(bazaarLat);
    console.log(bazaarLong);
    console.log(bazaarMaximumCapacity);
    console.log(bazaarDate);
    console.log(bazaarDescription);
    console.log(bazaarCity);
    var vendorTypeFavourable = [];
    for(var i = 0; i < 6; i++){
      if(_vendorTypeFavourables[i]==1){
        vendorTypeFavourable.push(getType(i));
      }
    }
    // console.log(data);
    const res = await axios.post(
      "http://localhost:4000/api/addbazzar",
      {
        "bazzarId":"BZ1X030",
        "vendorTypeFavourable": vendorTypeFavourable,
        "bazzarImageUrl": bazaarImageUrl,
        "bazzarLat": bazaarLat,
        "bazzarLong": bazaarLong,
        "bazzarName": bazaarName,
        "bazzarMaximumCapacity":bazaarMaximumCapacity,
        "bazzarDate":bazaarDate,
        "bazzarDescription":bazaarDescription,
        "bazzarCity":bazaarCity,
        "bazzarAddress":address,
      }
      // "vendorIdList":[],
    ).then((response)=>{
      console.log("Uploaded successfully");
      Router.push("/weekly_bazaars");

    })
    
  }
  const containerStyle = {
    // width: '800px',
    height: '400px',
    marginTop: '20px',
  };

  const [center,setCenter] = React.useState({
    lat:  19.0760,
    lng: 72.8777
  });

  const [position,setPosition] = React.useState({
    lat: 37.772,
    lng: -122.214
  })
   // Upload image
   const UploadImage = () =>{
    if (!file) {
      alert("Please upload an image first!");
    }
    const d = new Date();
    let time = d.getTime();
    const storageRef = ref(storage, `/weekly_bazaars/${time.toString()}`);
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
                setbazaarImageUrl(url);
                
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

  const [city,setcity] =React.useState("");
  const [date,setdate] =React.useState("");
  const SearchBar = () =>{
    return (
        <div className='vendor-registration-search-bar'>
            <div className="vendor-registration-search-bar-items">
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Control type="text" placeholder="Enter city" 
                    onChange={(text)=>{
                      city = text.target.value;
                    }}
                    />
                </Form.Group>
            </div>
            <div className="vendor-registration-search-bar-items">
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Control type="locality" placeholder="Enter Date" 
                    onChange={(text)=>{
                      date = text.target.value;
                    }}/>
                </Form.Group>
            </div>
            <div className="vendor-registration-search-bar-items">
                <Button variant="primary"
                onClick={async ()=>{
                  console.log(city);
                  console.log(date);
                  const res = await axios.post(
                    "http://localhost:4000/api/getbazzarsbycityandDate",{
                      "city" : city, 
                      "bazzarDate" : date
                    }
                  );
                  const data = await JSON.parse(JSON.stringify(res.data));
                  setWeeklyBazaarList(data);
                }}
                >Search</Button>{' '}
            </div>
        </div>
    )
}
    return (
      <div>
          <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
          <div className="vending-zone-main-container">
        <div className="add-vending-zones">
          <Accordion defaultActiveKey="1">
            <Accordion.Item eventKey="0">
              <Accordion.Header>
                <div className="pending-application-section-title">
                  Add Weekly bazaar
                </div>
              </Accordion.Header>
              <Accordion.Body>

                <CommonInput placeholderText="Enter bazaar name" onChange={(e)=>{
                  setbazaarName(e.target.value);
                }} />
                <CommonInput placeholderText="Enter date of the event" onChange={(e)=>{
                  setbazaarDate(e.target.value);
                }}/>
                <CommonInput placeholderText="Enter description of bazaar" onChange={(e)=>{
                  setbazaarDescription(e.target.value);
                }}/>
                <CommonInput placeholderText="Enter maximum capacity of vendors" onChange={(e)=>{
                  setbazaarMaximumCapacity(parseInt(e.target.value));
                }} />
                <div>
                    <input type="file" onChange={(e)=>{
                      file = e.target.files[0];
                    }} accept="/image/*" />
                    <button onClick={UploadImage}>Upload to Firebase</button>
                    <p> "% done"</p>
                </div>
                <img src={bazaarImageUrl} alt="" width={"600px"} />
                <Highlighter Text="Select favourable vendor categories" fontSize="1.2rem"/>
                <Form>
                  {['Foods and vegetables', 'Fast Food Veg','Fast Food Non-veg','Toys','Utensils','Flowers'].map((type) => (
                    <div key={`${type}`} className="mb-3">
                      <Form.Check 
                        type={"checkbox"}
                        id={`${type}`}
                        label={`${type}`}
                        
                        onChange={(e)=>{
                          var tmpvendorTypeFavourable = _vendorTypeFavourables;
                          tmpvendorTypeFavourable[findIdx(e.target.id)] ^=1;
                          setvendorTypeFavourable(tmpvendorTypeFavourable);
                        }}
                        value="1"
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
                      setbazaarLat(e.latLng.lat());
                      setbazaarLong(e.latLng.lng());
                      setPosition({ lat: e.latLng.lat(), lng: e.latLng.lng() });
                      Geocode.fromLatLng(
                        position.lat.toString(),
                        position.lng.toString()
                      ).then((response) => {
                        for (let i = 0; i < response.results[0].address_components.length; i++) {
                          for (let j = 0; j < response.results[0].address_components[i].types.length; j++) {
                            switch (response.results[0].address_components[i].types[j]) {
                              case "locality":
                                setbazaarCity(response.results[0].address_components[i].long_name);
                                break;
                                }
                              }
                            }
                        console.log(response.results[0].formatted_address);
                        setAddress(response.results[0].formatted_address);                        
                      });
                    }}
                  >
                    <Autocomplete
                    // onLoad={this.onLoad}
                    // onPlaceChanged={this.onPlaceChanged}
                    >
                      <input
                        type="text"
                        placeholder="Enter zone address"
                        defaultValue={""}
                        onChange={(e) => {
                          Geocode.fromAddress(e.target.value).then(
                            (response) => {
                              
                              for (let i = 0; i < response.results[0].address_components.length; i++) {
                                for (let j = 0; j < response.results[0].address_components[i].types.length; j++) {
                                  switch (response.results[0].address_components[i].types[j]) {
                                    case "locality":
                                      setbazaarCity(response.results[0].address_components[i].long_name);
                                      break;
                                  }
                                }
                              }
                              
                              const { lat, lng } =
                                response.results[0].geometry.location;
                                setbazaarLat(lat);
                                setbazaarLong(lng);
                                setPosition({ lat: lat, lng: lng });
                                setCenter({ lat: lat, lng: lng });
                            },
                            (error) => {
                              console.log(error);
                            }
                          );
                          setAddress(e.target.value);
                        }
                      }
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
                <Button style={{ marginTop: "20px" }} onClick={uploadData}>Submit</Button>
              </Accordion.Body>
            </Accordion.Item>
          </Accordion>
        </div>
        <SearchBar />
        <div className="vendor-zone-list">
          <ul>
            {WeeklyBazaarList.map((bazaar) => {
              let url = "/weekly_bazaar/" ;
              return (
                <li>
                  <Card key={bazaar.bazzarId}>
                    <Card.Body>
                      <Card.Title>
                        <div className="pending-application-section-title">
                          <a href={url}>Weekly bazaar id - {}</a>
                        </div>
                        <div className="pending-application-section-title">
                          {bazaar.bazzarName}
                          <br/>
                          Date - {bazaar.bazzarDate}
                        </div>
                      </Card.Title>
                      <Card.Subtitle className="mb-2 text-muted">
                        <div className="pending-application-section-desc">
                          {bazaar.bazzarCity}
                        </div>
                        {bazaar.bazzarDescription}
                        {/* <div>{reviews.custom_officer_date}</div> */}
                      </Card.Subtitle>
                      <Card.Text>{bazaar.bazzarMaximumCapacity}</Card.Text>
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
    )
  }


  export async function getServerSideProps(context) {
    const res = await axios.post(
      "http://localhost:4000/api/getbazzarsbycityandDate",{
        "city" : "Mumbai", 
        "bazzarDate" : "22/05/2002"
      }
    );
    const data = await JSON.parse(JSON.stringify(res.data));
    return {
      props: {
        WeeklyBazaars: data,
      },
    };
  }