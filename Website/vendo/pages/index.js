import styles from "../styles/Home.module.css";
import Navbar from "./components/Navbar";
import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faApple,
  faGooglePlay,
  faTwitter,
  faInstagram,
  faFacebook,
} from "@fortawesome/fontawesome-free-brands";
import {
  faBullseye,
  faChartLine,
  faMobile,
  faEnvelope,
  faLanguage,
} from "@fortawesome/fontawesome-free-solid";
import vendorImg from "./../Images/vendorphoto.png";
import Image from "next/image";
import Carousel from "react-bootstrap/Carousel";

export default function Home() {
  const [index, setIndex] = useState(0);
  const handleSelect = (selectedIndex, e) => {
    setIndex(selectedIndex);
  };
  return (
    <div className={styles.container}>
      <Navbar />
      <div className="HomeWrapper">
      <div className="flex">
        <div className="aunty">
        <Image  src={vendorImg} alt="Vendor img" /></div>
        <div className="TextWrapper">
          <div className={styles.headline}>
            “Impacting” the lives of 10 million vendors. <br />
            Govertment initiative to improve vendors life without compromising
            urban planning
            <br />
            <br />
            Vendor? Download the app now
          </div>

          <div className="download-btn app-store">
           
              <FontAwesomeIcon icon={faApple} size="2x" />
              <div>Download</div>
              
            
          </div>
          <div className="download-btn google-play">
           
              <FontAwesomeIcon icon={faGooglePlay} size="2x" />
              <div>Download</div> 
          </div>
          </div>
        </div>

      </div>
      <div className={styles.features}>
        <div className={styles.subheadline}>Features</div>
        <div className={styles.featurelist}>
          <div>
            <FontAwesomeIcon
              icon={faBullseye}
              size="4x"
              className="font-awesome-icons"
            />
            <div>
              {" "}
              Easy & simple <br /> to use{" "}
            </div>
          </div>
          <div>
            <FontAwesomeIcon
              icon={faMobile}
              size="4x"
              className="font-awesome-icons"
            />
            <div> Accessible to all </div>
            </div>
            <div>
              <FontAwesomeIcon
              icon={faLanguage}
              size="4x"
              className="font-awesome-icons"
              />
              <div>Multilingual</div>
            </div>
          
          <div>
            <FontAwesomeIcon
              icon={faChartLine}
              size="4x"
              className="font-awesome-icons"
            />
            <div>
              Robust environment <br /> for vendors
            </div>
          </div>
        </div>
      </div>
      
      <div className={styles.stories }>
        <div className={styles.headline}> Inspiring stories</div>
        <Carousel activeIndex={index} onSelect={handleSelect}>
          <Carousel.Item>
            <img
              // className="d-block w-100"
              src="https://www.sundaynews.co.zw/wp-content/uploads/sites/16/2018/11/vendor1.jpg"
              alt="First slide"
            />
            <Carousel.Caption>
              <h3>First slide label</h3>
              <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
            </Carousel.Caption>
          </Carousel.Item>
          <Carousel.Item>
            <img
              // className="d-block w-100"
              src="image.png"
              // src="holder.js/800x400?text=Second slide&bg=282c34"
              alt="Second slide"
            />

            <Carousel.Caption>
              <h3>Second slide label</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </Carousel.Caption>
          </Carousel.Item>
          <Carousel.Item>
            <img
              // className="d-block w-100"
              src="image.png"
              // src="holder.js/800x400?text=Third slide&bg=20232a"
              alt="Third slide"
            />

            <Carousel.Caption>
              <h3>Third slide label</h3>
              <p>
                Praesent commodo cursus magna, vel scelerisque nisl consectetur.
              </p>
            </Carousel.Caption>
          </Carousel.Item>
        </Carousel>
      </div>
      
      <div className={styles.footer}>
        <div className="social-media-icons">
          <a href="">
            <FontAwesomeIcon size="lg" icon={faEnvelope} />
          </a>
          <a href="">
            <FontAwesomeIcon size="lg" icon={faTwitter} />
          </a>
          <a href="">
            <FontAwesomeIcon size="lg" icon={faFacebook} />
          </a>
          <a href="">
            <FontAwesomeIcon size="lg" icon={faInstagram} />
          </a>
        </div>
        <div>© Copyright 2022 Vendo</div>
      </div>
    </div>
    
  );
}
