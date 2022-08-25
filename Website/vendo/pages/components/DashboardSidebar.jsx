import React from "react";
import styles from "../../styles/Home.module.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faHouseUser,
  faIdCard,
  faPenToSquare,
  faStore,
  faLocationCrosshairs,
  faCalendar,
  faHandshake,
} from "@fortawesome/free-solid-svg-icons";

function Side() {
  return (
    <div className="navcontainer">
      <div className="logocontainer">
        <div className="logo"></div>
      </div>
      <div className="wrapper">
        <ul>
          <li>
            <a href="/dashboard">
              <FontAwesomeIcon
                icon={faHouseUser}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Home
            </a>
          </li>
          <li>
            <a href="/vendor_registration">
              <FontAwesomeIcon
                icon={faIdCard}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Vendor Registration
            </a>
          </li>
          <li>
            <a href="/vendor_complaints">
              <FontAwesomeIcon
                icon={faStore}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Vendor Complaints
            </a>
          </li>
          <li>
            <a href="/vending_zones">
              <FontAwesomeIcon
                icon={faLocationCrosshairs}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Vending Zones
            </a>
          </li>
          <li>
            <a href="/weekly_bazaars">
              <FontAwesomeIcon
                icon={faCalendar}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Weekly Bazaar
            </a>
          </li>
          <li>
            <a href="/government_schemes">
              <FontAwesomeIcon
                icon={faHandshake}
                size="1x"
                style={{ marginRight: "10px" }}
              />
              Our Schemes
            </a>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Side;
