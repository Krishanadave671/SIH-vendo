import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import Rating from "@mui/material/Rating";
import Card from "react-bootstrap/Card";
import Form from "react-bootstrap/Form";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Tags from "./components/Tags";

export default function dashboard({ VendorComplaints }) {
  /**
   * @params for complaints
   * vendorId
   * complaintId
   * complaintDate
   * complaintStatus
   * complaintType
   * complaintImageUrl
   * complaintDescription
   * complaintCity
   */

  const [VendorComplaintsList, setVendorComplaintsList] =
    React.useState(VendorComplaints);
  const [city, setcity] = React.useState("");
  var [tag,settag] = React.useState("");
  console.log(VendorComplaintsList);
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
        </div>
        <div className="vendor-registration-search-bar-items">
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Control
              type="tags"
              placeholder="Enter tags"
              onChange={(text) => {
                tag = text.target.value;
              }}
            />
          </Form.Group>
        </div>
        <div className="vendor-registration-search-bar-items">
          <Button
            variant="primary"
            onClick={async () => {
              console.log(city);
              console.log(tag);
              if(city == ""){
                console.log("Enter city first man!!");

              }
              else if(tag == ""){
                const res = await axios.get("http://localhost:4000/api/getcomplaints/" + city);
                const data = await JSON.parse(JSON.stringify(res.data));
                setcity(city);
                setVendorComplaintsList(data);
              }
              else{
                const res = await axios.get("http://localhost:4000/api/getcomplaints/" + city + "/" + tag);
                console.log("http://localhost:4000/api/getcomplaints/" + city + "/" + tag);
                const data = await JSON.parse(JSON.stringify(res.data));
                setcity(city);
                setcity(tag);
                setVendorComplaintsList(data);
              }
            }}
          >
            Search
          </Button>{" "}
        </div>
      </div>
    );
  };

  const VendorReview = () => {
    console.log(VendorComplaintsList);
    VendorComplaintsList.map((reviews) => {
      console.log(reviews);
    });
    const reviews = VendorComplaintsList.map((reviews) => {
      return (
        <li key={reviews.complaintId}>
          <Card >
            <Card.Body>
              <Card.Title>
                <div
                  style={{
                    display: "flex",
                    flexDirection: "row",
                    justifyContent: "space-between",
                  }}
                >
                  <div className="pending-application-section-title">
                    <a href={"/complaints_section/" + reviews.complaintId}>
                      Vendor ID - {reviews.vendorId}
                      <br/>
                      Complaints ID - {reviews.complaintId}
                    </a>
                  </div>
                  <div>{reviews.complaintDate}</div>
                </div>
              </Card.Title>
              <Card.Subtitle className="mb-2 text-muted">
                <div className="pending-application-section-desc">
                  {reviews.complaintType.map((tags) => {
                    return <Tags Text={tags} />;
                  })}
                </div>
                <div>{reviews.custom_officer_date}</div>
              </Card.Subtitle>
              <Card.Text>{reviews.complaintDescription}</Card.Text>
              <Card.Link href={``}><Button onClick={ async (e)=>{
                const res = await axios.post("http://localhost:4000/api/resolvecomplaints/",{
                  complaintId: reviews.complaintId
                });
                const data = await JSON.parse(JSON.stringify(res.data));
                console.log(data);
              }}>Issue Resolved ?</Button></Card.Link>
              <Card.Link href={``}><Button>Rejected</Button></Card.Link>
              {/* <Card.Link href="#">Another Link</Card.Link> */}
            </Card.Body>
          </Card>
        </li>
      );
    });
    return reviews;
  };
  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="dashboard-main-container">
        <SearchBar />
        <div
          className="approved-application-main-container"
          style={{ height: "100vh" }}
        >
          <ul>
            <VendorReview />
          </ul>
        </div>
      </div>
    </div>
  );
}

export async function getServerSideProps(context) {
  const res = await axios.get("http://localhost:4000/api/getcomplaints/all");
  const data = await JSON.parse(JSON.stringify(res.data));
  return {
    props: {
      VendorComplaints: data,
    },
  };
}