import React from 'react'
import DashboardSidebar from './components/DashboardSidebar'

export default function dashboard() {
  return (
    <div>dashboard
        <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
        <div id="page-wrap">
            
        </div>
    </div>
  )
}
