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
      <div className={styles.headline}>Vendo</div>
      <div className={styles.subheadline}>Government Login</div>
      <CommonInput placeholderText='Enter Govt official ID' onChange={(e)=>{
        govtID = e.target.value;
      }}/>
      <CommonInput placeholderText='Enter password'onChange={(e)=>{
        password = e.target.value;
      }}/>
      <Button variant="primary" className='pending-application-banner' onClick={login}>Login</Button>
    </div>
  )

}
