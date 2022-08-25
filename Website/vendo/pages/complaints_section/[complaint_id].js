import Button from "react-bootstrap/Button";
import Navbar2 from "../components/Navbar2.jsx";
import React, { useEffect, useState } from "react";
import Rating from "@mui/material/Rating";
import Card from "react-bootstrap/Card";
import axios from "axios";
import Tags from "../components/Tags";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  Autocomplete,
} from "@react-google-maps/api";

function VendorApplicationDetails({ ComplaintDetails, VendorDetails }) {
  // Map params
  const containerStyle = {
    // width: '800px',
    height: "400px",
    marginTop: "20px",
  };

  // console.log(ComplaintDetails);
  // console.log(VendorDetails);
  // console.log("http://localhost:4000/api/getvendorsfromId/" + ComplaintDetails.vendorId);

  const [center, setCenter] = React.useState({
    lat: VendorDetails.shopLocationLat % 90,
    lng: VendorDetails.shopLocationLong % 90,
  });

  const [position, setPosition] = React.useState({
    lat: VendorDetails.shopLocationLat % 90,
    lng: VendorDetails.shopLocationLong % 90,
  });

  console.log(ComplaintDetails);
  console.log(VendorDetails);
  const MainContainer = () => {
    return (
      <div className="approved-application-main-container">
        <div className="pending-application-section-title">Vendor ID </div>
        <div className="pending-application-section-desc">
          <a href={"/approved_application/" + VendorDetails.vendorId }>
          {VendorDetails.vendorId}
          </a>
            
        </div>
        <div className="pending-application-section-title">Vendor Name </div>
        <div className="pending-application-section-desc">
          {VendorDetails.name}
        </div>
        <div className="pending-application-section-title">Documents </div>
        <div className="pending-application-docs">
          <a
            href={VendorDetails.aadharcardImageUrl}
            target="_blank"
            rel="noreferrer"
          >
            View Aadhar Card
          </a>
          <a
            href={VendorDetails.pancardImageUrl}
            target="_blank"
            rel="noreferrer"
          >
            View PAN Card
          </a>
        </div>
        <div className="pending-application-section-title">Complaint tags </div>
        <div className="pending-application-section-desc">
          {ComplaintDetails.complaintType.map((tags) => {
            return <Tags Text={tags} />;
          })}
        </div>
        <div className="pending-application-section-title">
          Complaint description{" "}
        </div>
        <div className="pending-application-section-desc">
          {ComplaintDetails.complaintDescription}
        </div>
        <div className="pending-application-section-title">Image</div>
        <img src={ComplaintDetails.complaintImageUrl} alt="" />
        <div className="pending-application-section-title">
          Vendor Location{" "}
        </div>
        <div className="pending-application-section-desc">
          {VendorDetails.shopLocationAddress}
        </div>

        <LoadScript
          googleMapsApiKey="AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"
          libraries={["places"]}
        >
          <GoogleMap
            id="marker-example"
            mapContainerStyle={containerStyle}
            center={center}
            zoom={16}
          >
            <MarkerF position={position} />
          </GoogleMap>
        </LoadScript>
      </div>
    );
  };

  return (
    <div className="approved-application-container">
      <Navbar2 />
      <div className="license-id">License No - {VendorDetails.vendorId}</div>
      <MainContainer />
    </div>
  );
}

export default VendorApplicationDetails;

export async function getServerSideProps(context) {
  const { params } = context;
  const { complaint_id } = params;
  const res = await axios.get(
    "http://localhost:4000/api/getcomplaintsbyid/" + complaint_id
  );
  const data = await JSON.parse(JSON.stringify(res.data));
  const res2 = await axios.get(
    "http://localhost:4000/api/getvendorsfromId/" + data[0].vendorId
  );
  const data2 = await JSON.parse(JSON.stringify(res2.data));
  // console.log(data2);
  console.log("dbfvjhdbvhbetsj");
  return {
    props: {
      ComplaintDetails: data[0],
      VendorDetails: data2,
    },
  };
}