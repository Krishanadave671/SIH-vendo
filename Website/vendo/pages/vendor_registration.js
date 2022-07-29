import React from 'react'
import DashboardSidebar from './components/DashboardSidebar'

export default function dashboard() {
    return (
      <div>
            <div className="dashboard-content">
                <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
                <div className="dashboard-main-container">
                    <div className="vendor-registration-navbar">
                        <div className="vendor-registration-navbar-items">Pending Registration</div>
                        <div className="vendor-registration-navbar-items">Approved Registration</div>
                    </div>
                </div>

            </div>
      </div>
    )
  }