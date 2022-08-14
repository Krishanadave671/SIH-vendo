import React, { useEffect, useState } from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Button from "react-bootstrap/Button";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import Navbar2 from "./components/Navbar2.jsx";

export default function dashboard() {
  let [state, changeState] = useState(0);
  let [cityState, changeCity] = useState("");
  let [localityState, changeLocality] = useState("");
  var city = "";
  var locality = "";
  const MainContainer = () => {
    const numbers = [
      {
        applicationID: "A11",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A12",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A13",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A14",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A15",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A16",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A17",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A18",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A19",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A20",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A21",
        vendorName: "Kirti college vada pav",
      },
      {
        applicationID: "A22",
        vendorName: "Kirti college vada pav",
      },
    ];
    const listItems = numbers.map((application) => {
      if (state == 0) {
        return (
          <li>
            <Card>
              <Card.Body>
                <Card.Title>{application.vendorName}</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  {application.applicationID}
                </Card.Subtitle>
                <Card.Text>
                  Some quick example text to build on the card title and make up
                  the bulk of the card's content.
                </Card.Text>
                <Card.Link
                  href={`/pending_application/${application.applicationID}`}
                >
                  Card Link
                </Card.Link>
                <Card.Link href="#">Another Link</Card.Link>
              </Card.Body>
            </Card>
          </li>
        );
      } else {
        return (
          <li>
            <Card>
              <Card.Body>
                <Card.Title>{application.vendorName}</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  {application.applicationID}
                </Card.Subtitle>
                <Card.Text>
                  Some quick example text to build on the card title and make up
                  the bulk of the card's content. Application ke andar hu
                </Card.Text>
                <Card.Link
                  href={`/approved_application/${application.applicationID}`}
                >
                  Card Link
                </Card.Link>
                <Card.Link href="#">Another Link</Card.Link>
              </Card.Body>
            </Card>
          </li>
        );
      }
    });

    if (state == 0) {
      return (
        <div className="vendor-registration-main-container">
          <ul>{listItems}</ul>
        </div>
      );
    } else {
      return (
        <div className="vendor-registration-main-container">
          <ul>{listItems}</ul>
        </div>
      );
    }
  };

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
              placeholder="Enter locality"
              onChange={(text) => {
                locality = text.target.value;
              }}
            />
          </Form.Group>
        </div>
        {/* <div className="vendor-registration-search-bar-items">
                    <Button variant="outline-primary" className='outline-btn'
                    onClick={()=>{
                        changeCity(""),
                        changeLocality("")
                    }}
                    >Clear</Button>{' '}
                </div> */}
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
        <div className="dashboard-main-container">
          {/* <Navbar2 /> */}
          <Navbar />
          <SearchBar />
          <MainContainer />
        </div>
      </div>
    </div>
  );
}
