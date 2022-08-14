import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Header from "./components/Header";
import Content from "./components/Content.js";

export default function dashboard() {
  return (
    <div className="DashboardContainer">
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="dashboard-main-container" style={{ marginLeft: 0 }}>
        <Header pageWrapId={"pagewrap1"} outerContainerId={"container1"} />
        <Content pageWrapId={"page-wrap2"} outerContainerId={"container2"} />
      </div>
    </div>
  );
}
