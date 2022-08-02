import Button from 'react-bootstrap/Button';
import Navbar2 from '../components/Navbar2.jsx';
import React, { useEffect, useState } from 'react';

function VendorApplicationDetails({VendorId}){
    let [state,changeState] = useState(0);

    const MainContainer = () =>{

        if(state == 0){
            return (
                <div className="approved-application-main-container">
                    
                </div>
                )
            }
        else{
            return (
                <div className="approved-application-main-container">
                    
                </div>
            )
        }
    }

    const Navbar = () =>{
        if(state == 0){
            return (
                <div className="approved-application-navbar">
                    <div 
                    className="approved-application-navbar-items approved-application-navbar-items-active" onClick={()=>changeState(0)}>Vendor Details</div>
                    <div className="approved-application-navbar-items" onClick={()=>changeState(1)}>Locations and Documents</div>
                    <div className="approved-application-navbar-items" onClick={()=>changeState(2)}>Customer Review and feedback</div>
                </div>
            )
        }
        else if(state == 1){
            return (
                <div className="approved-application-navbar">
                    <div className="approved-application-navbar-items" onClick={()=>changeState(0)}>Vendor Details</div>
                    <div 
                    className="approved-application-navbar-items approved-application-navbar-items-active" onClick={()=>changeState(1)}>Locations and Documents</div>
                    <div className="approved-application-navbar-items" onClick={()=>changeState(2)}>Customer Review and feedback</div>
                </div>
            )
        }
        else{
            return (
                <div className="approved-application-navbar">
                    <div className="approved-application-navbar-items" onClick={()=>changeState(0)}>Vendor Details</div>
                    <div className="approved-application-navbar-items" onClick={()=>changeState(1)}>Locations and Documents</div>
                    <div 
                    className="approved-application-navbar-items approved-application-navbar-items-active" onClick={()=>changeState(2)}>Customer Review and feedback</div>
                </div>
            )
        }
    }

    return (
        <div className="approved-application-container">
            <Navbar2/>
            <div className="license-id">License No - LW1ER34D23SWQ</div>
            <Navbar />
            <MainContainer/>
        </div>
    );
}

export default VendorApplicationDetails

export async function getServerSideProps(context){
    const {params} = context;
    const {vendor_id} = params;
    return {
        props: { 
            VendorId: vendor_id,
        } 
    }
}