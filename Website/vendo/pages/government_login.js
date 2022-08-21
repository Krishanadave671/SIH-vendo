import React, { useEffect } from "react";
import Button from "react-bootstrap/Button";
import Router from "next/router";
import CommonInput from "./components/CommonInput";
import styles from "../styles/Home.module.css";
import Image from "next/image";
import loginimage from "../Images/LoginScreen1.png";

export default function government_login() {
  var govtID = "",
    password = "";
  var login = (e) => {
    // console.log(govtID);
    // console.log(password)
    Router.push("/dashboard");
  };

  return (

    <div className="govt-login-container">
      <div className="ContainerForLogin">
        <div className="closeGridVerticalHeaderContainer">
        <h1 className="vendoHeaderLoginScreen">Vendo</h1>
        <h1 className="vendoTextLoginScreen">Government Login</h1>
        </div>
        <div className="InputForLogin">
          <CommonInput
            placeholderText="Enter Govt official ID"
            onChange={(e) => {
              govtID = e.target.value;
            }}
          />
          <CommonInput
            placeholderText="Enter password"
            onChange={(e) => {
              password = e.target.value;
            }}
          />
        </div>
        <div className="containerforbutton">
          <Button className="button" onClick={login}>
            Login
          </Button>
        </div>
      </div>
      <div classname="ImageForLogin">
        <Image src={loginimage} ></Image>
      </div>

    </div>
  );
}
