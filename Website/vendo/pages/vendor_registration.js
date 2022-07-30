import React, { useEffect, useState } from 'react'
import DashboardSidebar from './components/DashboardSidebar'
import Button from 'react-bootstrap/Button';
import FloatingLabel from 'react-bootstrap/FloatingLabel';
import Form from 'react-bootstrap/Form';

export default function dashboard() {
    let [state,changeState] = useState(0);
    let [city,changeCity] = useState("");
    let [locality,changeLocality] = useState("");
    const MainContainer = () =>{

        return (
            <div>
                
            </div>
        )
    }
    const SearchBar = () =>{
        return (
            <div className='vendor-registration-search-bar'>
                <div className="vendor-registration-search-bar-items">
                    <Form.Group className="mb-3" controlId="formBasicEmail">
                        <Form.Control type="city" placeholder="Enter city" />
                    </Form.Group>
                </div>
                <div className="vendor-registration-search-bar-items">
                    <Form.Group className="mb-3" controlId="formBasicEmail">
                        <Form.Control type="locality" placeholder="Enter locality" />
                    </Form.Group>
                </div>
                <div className="vendor-registration-search-bar-items">
                    <Button variant="outline-primary" className='outline-btn'>Clear</Button>{' '}
                </div>
            </div>
        )
    }
    const Navbar = () =>{

        if(state == 0){
            return (
                <div className="vendor-registration-navbar">
                    <div 
                    className="vendor-registration-navbar-items vendor-registration-navbar-items-active" >Pending Registration</div>
                    <div className="vendor-registration-navbar-items" onClick={changeState(1)}>Approved Registration</div>
                </div>
            )
        }
        else{
            return (
                <div className="vendor-registration-navbar">
                    <div 
                    className="vendor-registration-navbar-items vendor-registration-navbar-items-active" 
                    onClick={changeState(0)}>Pending Registration</div>
                    <div className="vendor-registration-navbar-items">Approved Registration</div>
                </div>
            )
        }
    }
    return (
      <div>
            <div className="dashboard-content">
                <DashboardSidebar pageWrapId={'page-wrap'} outerContainerId={'outer-container'}/>
                <div className="dashboard-main-container">
                    <Navbar />
                    <SearchBar/>
                    <MainContainer/>
                </div>

            </div>
      </div>
    );
  }