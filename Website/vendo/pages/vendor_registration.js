import React, { useEffect, useState } from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Button from "react-bootstrap/Button";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import { faLocationArrow } from "@fortawesome/free-solid-svg-icons";

export default function dashboard({ VendorsPending, VendorsApproved }) {
  console.log(VendorsPending);
  console.log(VendorsApproved);
  /**
   * Vendor Params
   * vendorId
   * name
   * dob
   * gender
   * address
   * phone
   * aadharNo
   * panCardNo
   * isPassport
   * isElectionid
   * isMcgmLicense
   * aadharcardImageUrl
   * pancardImageUrl
   * shopLocationAddress
   * shopLocationLat
   * shopLocationLong
   * vendingZoneIdApplied
   * shopCity
   * creditScore
   * vendorImageurl
   * isApproved
   * complaintsList
   * reviewList
   * weeklyBazzarList
   * vendorCategory
   * shopName
   */
  let [pendingList, setpendingList] = useState(VendorsPending);
  let [approvedList, setapprovedList] = useState(VendorsApproved);
  let [state, changeState] = useState(0);

  const MainContainer = () => {
    if (state == 0) {
      return (
        <div className="vendor-registration-main-container">
          <ul>
            {pendingList.map((application) => {
              return (
              <li>
                <Card>
                  <Card.Body>
                    <Card.Title>{application.shopName}</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">
                      {application.vendorId}
                    </Card.Subtitle>
                    <Card.Text>
                      Some quick example text to build on the card title and
                      make up the bulk of the card's content.
                    </Card.Text>
                    <Card.Link
                      href={`/pending_application/${application.vendorId}`}
                    >
                        <FontAwesomeIcon icon={faLocationArrow}  style={{paddingRight:"4px"}}/>
                      View Details
                    </Card.Link>
                    {/* <Card.Link href="#">Another Link</Card.Link> */}
                  </Card.Body>
                </Card>
              </li>);
            })}
          </ul>
        </div>
      );
    } else {
      return (
        <div className="vendor-registration-main-container">
          <ul>
            {approvedList.map((application) => {
              return(
              <li>
                <Card>
                  <Card.Body>
                    <Card.Title>{application.vendorName}</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">
                      {application.vendorId}
                    </Card.Subtitle>
                    <Card.Text>
                      Some quick example text to build on the card title and
                      make up the bulk of the card's content.
                    </Card.Text>
                    <Card.Link
                      href={`/approved_application/${application.vendorId}`}
                    >
                      <FontAwesomeIcon icon={faLocationArrow}  style={{paddingRight:"4px"}}/>
                      View details
                    </Card.Link>
                    {/* <Card.Link href="#">Another Link</Card.Link> */}
                  </Card.Body>
                </Card>
              </li> );
            })}
          </ul>
        </div>
      );
    }
  };

  let [city, setcity] = useState("");
  // let [localityState, changeLocality] = useState("");
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
        {/* <div className="vendor-registration-search-bar-items">
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Control
              type="locality"
              placeholder="Enter locality"
              onChange={(text) => {
                locality = text.target.value;
              }}
            />
          </Form.Group>
        </div> */}
        <div className="vendor-registration-search-bar-items">
          <Button
            variant="primary"
            onClick={ async () => {
              if(state == 0){
                const res = await axios.get("http://localhost:4000/api/getvendors/pending" + city);
                const data = await JSON.parse(JSON.stringify(res.data));
                setpendingList(data);
              }
              else{
                const res = await axios.get("http://localhost:4000/api/getvendors/approved" + city);
                const data = await JSON.parse(JSON.stringify(res.data));
                setpendingList(data);
              }
            }}
          >
            Search
          </Button>{" "}
        </div>
      </div>
    );
  };
  const Navbar = () => {
    if (state == 0) {
      return (
        <div className="vendor-registration-navbar">
          <div
            className="vendor-registration-navbar-items vendor-registration-navbar-items-active"
            onClick={() => changeState(0)}
          >
            Pending Registration
          </div>
          <div
            className="vendor-registration-navbar-items"
            onClick={() => changeState(1)}
          >
            Approved Registration
          </div>
        </div>
      );
    } else {
      return (
        <div className="vendor-registration-navbar">
          <div
            className="vendor-registration-navbar-items"
            onClick={() => changeState(0)}
          >
            Pending Registration
          </div>
          <div
            className="vendor-registration-navbar-items  vendor-registration-navbar-items-active"
            onClick={() => changeState(1)}
          >
            Approved Registration
          </div>
        </div>
      );
    }
  };
  return (
    <div>
      <div className="dashboard-content">
        <DashboardSidebar
          pageWrapId={"page-wrap"}
          outerContainerId={"outer-container"}
        />
        <div className="dashboard-main-container" style={{width:"100%"}}>
          {/* <Navbar2 /> */}
          <Navbar />
          <SearchBar />
          <MainContainer />
        </div>
      </div>
    </div>
  );
}

export async function getServerSideProps(context) {
  const res = await axios.get("http://localhost:4000/api/getvendors/pending");
  const data = await JSON.parse(JSON.stringify(res.data));
  const res1 = await axios.get("http://localhost:4000/api/getvendors/approved");
  console.log(data);
  console.log(data);
  const data1 = await JSON.parse(JSON.stringify(res1.data));
  return {
    props: {
      VendorsApproved: data1,
      VendorsPending: data,
    },
  };
}