import React, { useEffect, useState } from 'react'
import DashboardSidebar from './components/DashboardSidebar'

export default function dashboard(){
    return (
        <div>
            <div className="dashboard-content">
            <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
            <div className="dashboard-main-container">
                <Navbar2/>
            </div>
            </div>
        </div>
    );

}