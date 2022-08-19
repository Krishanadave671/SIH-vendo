import React , { useEffect }from 'react'
import Button from 'react-bootstrap/Button';
import Router from 'next/router';
import CommonInput from './components/CommonInput';
import styles from '../styles/Home.module.css';

export default function government_login() {
  var govtID = "", password = "";
  var login= e =>{
    // console.log(govtID);
    // console.log(password)
    Router.push('/dashboard')
  }

  return (
    <div className='govt-login-container'>
      <div style={{height:"40px"}}/>
      <div className='ContainerForLogin'>
        <div className='VendoTitle'>Vendo</div>
        <div className='VendoTitle2'>Government Login</div>
        <div className='InputForLogin'>
          <CommonInput placeholderText='Enter Govt official ID' onChange={(e)=>{
            govtID = e.target.value;
          }}/>
          <CommonInput placeholderText='Enter password'onChange={(e)=>{
            password = e.target.value;
          }}/>
          <div className='containerforbutton'>
            <Button  className='button' onClick={login} 
            style={{
              width:"340px",
              height:"50px"
            }}
            >Login</Button>
          </div>
        </div>
      </div>
      
    </div>
  )

}
