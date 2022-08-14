import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";

export default function dashboard() {
  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="dashboard-main-container"></div>
    </div>
  );
}
