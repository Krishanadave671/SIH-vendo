import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import CommonInput from "../pages/components/CommonInput";
import { Button } from "react-bootstrap";
import { ref, getDownloadURL, uploadBytesResumable } from "firebase/storage";
import { storage } from './firebase';
export default function dashboard() {
  /**
   * @Params
   * schemeId
   * schemeImageUrl
   * schemeReq
   * schemeBenefits
   * schemeName
   */
  const [schemeName, setschemeName] = React.useState("");
  const [schemeId, setschemeId] = React.useState("");
  const [schemeImageUrl, setschemeImageUrl] = React.useState("");
  const [schemeReq, setschemeReq] = React.useState("");
  const [schemeBenefits, setschemeBenefits] = React.useState("");
  var file;
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
                setschemeImageUrl(url);
                
            });
        }
    );
  }

  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="ForImage">
        
      </div>
      <div
        className="dashboard-main-container"
        style={{
          display:"flex",
          flexDirection:"row",
          paddingLeft: "30px",
          paddingRight: "30px",
          backgroundImage: "linear-gradient( 112.1deg,  rgba(63,76,119,1)11.4%  ,rgba(32,38,57,1) 70.2%)"
         
        }}
      >
        <div className="inputforschema">
        <CommonInput
          placeholderText="Enter schema name"
          onChange={(e) => {
            setschemeName(e.target.value);
          }}
        />
        <CommonInput
          placeholderText="Enter the benefits"
          onChange={(e) => {
            setschemeBenefits(e.target.value);
          }}
        />
        <CommonInput
          placeholderText="Enter description of scheme"
          onChange={(e) => {
            // setbazaarDescription(e.target.value);
          }}
        />
        </div>
        <div className="inputforschemas">
        <div>
                    <input type="file" onChange={(e)=>{
                      file = e.target.files[0];
                    }} accept="/image/*" />
                    <Button onClick={UploadImage} style={{marginTop:"60px"}}>Upload Image</Button>
                </div>
                <img src={schemeImageUrl} alt="" width={"600px"} />
                
        </div>
      </div>
    </div>
  );
}