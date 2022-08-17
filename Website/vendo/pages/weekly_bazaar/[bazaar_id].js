import Highlighter from "../components/Highlighter";
import Navbar from "../components/Navbar2";
import React from "react";
import {
  GoogleMap,
  LoadScript,
  MarkerF,
  Autocomplete,
} from "@react-google-maps/api";

export default function Bazaar({BazaarID}){

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

    return(
        <div className="bazaar-main-container">
          <Highlighter Text="Bazaar ID - B1234234" fontSize="1.6rem"/>
          <div className="bazaar-flex">
            <div>
              <Highlighter Text="Date of the event" fontSize="1.2rem"/>
              <div className="pending-application-section-desc">16/04/2003</div>
              <Highlighter Text="Maximum vendors capacity" fontSize="1.2rem"/>
              <div className="pending-application-section-desc">12</div>
              <Highlighter Text="Bazaar Description" fontSize="1.2rem"/>
              <div className="pending-application-section-desc">Best bazaar</div>
            </div>
            <div>
              <Highlighter Text="Location of Event" fontSize="1.2rem"/>
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
          </div>
          
        </div>
    );
}


export async function getServerSideProps(context) {
    const { params } = context;
    const { bazaar_id } = params;
    return {
      props: {
        BazaarID: bazaar_id,
      },
    };
  }