import Button from "react-bootstrap/Button";
import Navbar2 from "../components/Navbar2.jsx";
import React, { useState } from "react";
import Rating from "@mui/material/Rating";
import Card from "react-bootstrap/Card";
import axios from "axios";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
} from "@react-google-maps/api";

function VendorApplicationDetails({ VendorDetails, VendorId }) {
  let [state, changeState] = useState(0);
  const containerStyle = {
    // width: '800px',
    height: "400px",
    marginTop: "20px",
  };
  console.log(VendorDetails);
  const position = {
    lat: 37.772,
    lng: -122.214,
  };

  const MainContainer = () => {
    const custom_officer_review = [
      {
        rating: "2.5",
        custom_officer_date: "16/04/2023",
        custom_officer_title:
          "Quality not upto expectation, bad quality of water used",
        desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
      },
      {
        rating: "4.5",
        custom_officer_date: "16/05/2023",
        custom_officer_title: "All standards passed 👍",
        desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
      },
      {
        rating: "1",
        custom_officer_date: "16/06/2023",
        custom_officer_title: "Cannot provide documents for verification",
        desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
      },
    ];
    const CustomOfficerReview = () => {
      const reviews = custom_officer_review.map((reviews) => {
        return (
          <li>
            <Card>
              <Card.Body>
                <Card.Title>{reviews.custom_officer_date}</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  <Rating
                    name="read-only"
                    precision={0.5}
                    value={parseInt(reviews.rating)}
                    readOnly
                  />
                  <div className="pending-application-section-desc">
                    {" "}
                    {reviews.custom_officer_title}{" "}
                  </div>
                </Card.Subtitle>
                <Card.Text>{reviews.desc}</Card.Text>
                <Card.Link href={``}>Card Link</Card.Link>
                <Card.Link href="#">Another Link</Card.Link>
              </Card.Body>
            </Card>
          </li>
        );
      });
      return reviews;
    };
    if (state == 0) {
      return (
        <div className="approved-application-main-container" style={{overflow:"hidden"}}>
          <div style={{display:"flex",flexDirection:"row",justifyContent:"space-evenly"}}>
            <div className="profphoto">
              
            </div>
            <div>
              <Button variant="primary" className="pending-application-banner"
              style={{marginLeft:"0%"}}
              >
                {VendorDetails.vendorId}
              </Button>{" "}
              <div className="pending-application-section-title">Shop Name </div>
              <div className="pending-application-section-desc">
                {VendorDetails.shopName}
              </div>
              <div className="pending-application-section-title">Vendor Type </div>
              <div className="pending-application-section-desc">
                {VendorDetails.vendorCategory}
              </div>
            </div>
            <div>
              <Button variant="primary" className="pending-application-banner" style={{marginLeft:"0%"}}> 
                Applicant Details{" "}
              </Button>{" "}
              <div className="pending-application-section-title">
                Applicant Name{" "}
              </div>
              <div className="pending-application-section-desc">
                {" "}
                {VendorDetails.name}{" "}
              </div>
              <div className="pending-application-section-title">
                Applicant Address{" "}
              </div>
              <div className="pending-application-section-desc">
                {VendorDetails.shopLocationAddress}
              </div>
            </div>
          </div>
          <div className="pending-application-btn">
            <Button variant="primary">Send Warning</Button>{" "}
            <Button variant="primary">Revoke license</Button>{" "}
          </div>
        </div>
      );
    } else if (state == 1) {
      return (
        <div className="approved-application-main-container">
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
          <div className="pending-application-section-title">
            Vendor Location{" "}
          </div>
          <div className="pending-application-section-desc">
            Govardhan complex, Jogeshwari East
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
              <MarkerF
                // onLoad={onLoad}
                position={position}
              />
              {/* Child components, such as markers, info windows, etc. */}
              {/* <></> */}
              <MarkerF />
            </GoogleMap>
          </LoadScript>
        </div>
      );
    } else {
      return (
        <div className="approved-application-main-container">
          <div className="pending-application-section-title">Ratings</div>
          <Rating name="read-only" value={3} readOnly />
          <ul>
            <CustomOfficerReview />
          </ul>
        </div>
      );
    }
  };

  const Navbar = () => {
    if (state == 0) {
      return (
        <div className="approved-application-navbar">
          <div
            className="approved-application-navbar-items approved-application-navbar-items-active"
            onClick={() => changeState(0)}
          >
            Vendor Details
          </div>
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(1)}
          >
            Locations and Documents
          </div>
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(2)}
          >
            Customer Review
          </div>
        </div>
      );
    } else if (state == 1) {
      return (
        <div className="approved-application-navbar">
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(0)}
          >
            Vendor Details
          </div>
          <div
            className="approved-application-navbar-items approved-application-navbar-items-active"
            onClick={() => changeState(1)}
          >
            Locations and Documents
          </div>
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(2)}
          >
            Customer Review
          </div>
        </div>
      );
    } else {
      return (
        <div className="approved-application-navbar">
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(0)}
          >
            Vendor Details
          </div>
          <div
            className="approved-application-navbar-items"
            onClick={() => changeState(1)}
          >
            Locations and Documents
          </div>
          <div
            className="approved-application-navbar-items approved-application-navbar-items-active"
            onClick={() => changeState(2)}
          >
            Customer Review
          </div>
        </div>
      );
    }
  };

  return (
    <div className="approved-application-container">
      <Navbar2 />
      <div className="license-id">License No - LW1ER34D23SWQ</div>
      <Navbar />
      <MainContainer />
    </div>
  );
}

export default VendorApplicationDetails;

export async function getServerSideProps(context) {
  const { params } = context;
  const { vendor_id } = params;
  const res = await axios.get(
    "http://localhost:4000/api/getvendorsfromID/" + vendor_id
  );
  // console.log(res);
  const data = await JSON.parse(JSON.stringify(res.data));
  return {
    props: {
      VendorDetails: data,
      VendorId: vendor_id,
    },
  };
}
