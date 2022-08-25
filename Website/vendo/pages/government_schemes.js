import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import CommonInput from "../pages/components/CommonInput";
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

  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div
        className="dashboard-main-container"
        style={{
          paddingLeft: "30px",
          paddingRight: "30px"
        }}
      >
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
          placeholderText="Enter description of bazaar"
          onChange={(e) => {
            // setbazaarDescription(e.target.value);
          }}
        />
      </div>
    </div>
  );
}