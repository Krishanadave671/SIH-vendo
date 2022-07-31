import React from 'react'
import DashboardSidebar from './components/DashboardSidebar'

export default function dashboard() {
  return (
    <div>
        <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
        <div className="dashboard-main-container">
            Hello main page 
        </div>
    </div>
  )
}
