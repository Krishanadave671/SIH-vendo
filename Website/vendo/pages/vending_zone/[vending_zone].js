import Highlighter from "../components/Highlighter";
import Navbar from "../components/Navbar2";
import React from "react";
import axios from "axios";
import { Button } from "react-bootstrap";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  Autocomplete,
} from "@react-google-maps/api";
import Card from "react-bootstrap/Card";

export default function Bazaar({ VendingZoneID, VendingZoneData }) {
  const containerStyle = {
    // width: '800px',
    height: "400px",
    marginTop: "20px",
  };
  console.log(VendingZoneData);
  let vendorList = [
    { vendorID: "V134dw4", vendorName: "Kirti College" },
    { vendorID: "V134dw4", vendorName: "Kirti College" },
    { vendorID: "V134dw4", vendorName: "Kirti College" },
    { vendorID: "V134dw4", vendorName: "Kirti College" },
    { vendorID: "V134dw4", vendorName: "Kirti College" },
  ];
  const [center, setCenter] = React.useState({
    lat: VendingZoneData.vendingZoneLat,
    lng: VendingZoneData.vendingZoneLong,
  });


  const [state, setState] = React.useState(0);

  const MainContainer1 = () => {
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
      return VendingZoneData.vendorIdList.map((reviews) => {
        return (
          <li>
            <Card>
              <Card.Body>
                <Card.Title>{reviews.vendorId}</Card.Title>
                {/* <Card.Subtitle className="mb-2 text-muted">
                  <div className="pending-application-section-desc">
                    {" "}
                    {reviews.custom_officer_title}{" "}
                  </div>
                </Card.Subtitle>
                <Card.Text>{reviews.desc}</Card.Text> */}
                <Card.Link href={``}><Button>Accept</Button></Card.Link>
                <Card.Link href="#"><Button>Reject</Button></Card.Link>
              </Card.Body>
            </Card>
          </li>
        );
      });
    };
    return (
      <div className="approved-application-main-container" style={{height:"80vh"}}>
        <ul>
          <CustomOfficerReview style={{ color: "red" }} />
        </ul>
      </div>
    );
  };

  const MainContainer = () => {
    if (state == 0) {
      return (
        <div>
          <Highlighter Text={"Vending Zone ID - " + VendingZoneID } fontSize="1.6rem" />
          <div className="bazaar-flex">
            <div>
              <Highlighter Text="Zone description" fontSize="1.2rem" />
              <div className="bazaar-section-desc">{VendingZoneData.vendingZoneDescription}</div>
              <Highlighter Text="Maximum vendors capacity" fontSize="1.2rem" />
              <div className="bazaar-section-desc">{VendingZoneData.maximumVendorsAllowed}</div>
              <Highlighter Text="Ward number" fontSize="1.2rem" />
              <div className="bazaar-section-desc">{VendingZoneData.vendingZoneWard}</div>
              <Highlighter Text="Vending zone address" fontSize="1.2rem" />
              <div className="bazaar-section-desc">{VendingZoneData.vendingZoneAddress}</div>
              <Highlighter Text="Vending zone image" fontSize="1.2rem" />
              <img src={VendingZoneData.vendingZoneImageurl} alt="" />
            </div>
            <div>
              <Highlighter Text="Location of Event" fontSize="1.2rem" />
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
                  <MarkerF
                    // onLoad={onLoad}
                    position={center}
                  />
                  {/* Child components, such as markers, info windows, etc. */}
                  {/* <></> */}
                  <MarkerF />
                </GoogleMap>
              </LoadScript>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div>
          <MainContainer1 />
        </div>
      );
    }
  };

  const Navbar = () => {
    if (state == 0) {
      return (
        <div className="vendor-registration-navbar">
          <div
            className="vendor-registration-navbar-items vendor-registration-navbar-items-active"
            onClick={() => setState(0)}
          >
            Vendor zone details
          </div>
          <div
            className="vendor-registration-navbar-items"
            onClick={() => setState(1)}
          >
            Vendor List
          </div>
        </div>
      );
    } else {
      return (
        <div className="vendor-registration-navbar">
          <div
            className="vendor-registration-navbar-items"
            onClick={() => setState(0)}
          >
            Vendor zone details
          </div>
          <div
            className="vendor-registration-navbar-items  vendor-registration-navbar-items-active"
            onClick={() => setState(1)}
          >
            Vendor List
          </div>
        </div>
      );
    }
  };

  return (
    <div className="bazaar-main-container">
      <Navbar />
      <MainContainer />
    </div>
  );
}

export async function getServerSideProps(context) {
  const { params } = context;
  const { vending_zone } = params;
  const res = await axios.get(
    "http://localhost:4000/api/getvendingzonesbyId/" + vending_zone,
  );
  const data = await JSON.parse(JSON.stringify(res.data));
  return {
    props: {
      VendingZoneID: vending_zone,
      VendingZoneData: data,
    },
  };
}