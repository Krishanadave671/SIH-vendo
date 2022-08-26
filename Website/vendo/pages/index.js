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
        <div className={styles.headline}> Inspiring story of vendors</div>
        <Carousel activeIndex={index} onSelect={handleSelect}>
          <Carousel.Item style={{height:"200px  "}} >
            {/* <img
              // className="d-block w-100"
              src="https://www.sundaynews.co.zw/wp-content/uploads/sites/16/2018/11/vendor1.jpg"
              alt="First slide"
            /> */}
            <Carousel.Caption style={{backgroundColor:"black",opacity:"80%"}}>
              <h3> Swapnil journey to success
              </h3>
              <p >
                Swapnil Pandhare is one of millions who are part of an informal workforce that has emerged in the last few years and whose circumstances did not leave them with much choice
Swapnil Pandhare has tried to defy his circumstances and pick up skills that have kept him going despite the lack of a good formal education

                <a href="https://www.livemint.com/budget/news/the-story-of-a-street-vendor-who-drove-his-way-out-of-poverty-1548874595069.html">Read more</a>
              </p>
            </Carousel.Caption>
          </Carousel.Item>
          <Carousel.Item style={{height:"200px"}}>
            {/* <img
              // className="d-block w-100"
              src="image.png"
              // src="holder.js/800x400?text=Second slide&bg=282c34"
              alt="Second slide"
            /> */}

            <Carousel.Caption style={{backgroundColor:"black",opacity:"80%"}}>
              <h3>From encroachers to self-employed</h3>
              <p>Dinesh Kumar Dixit is one of those street vendors—known locally as a “rehri-patri walla”—and he’s spent the last 40 years standing on a Delhi street, selling the sort of glass bangles that are a specialty
of Firozabad, his hometown in Uttar Pradesh. According to India’s Ministry of Housing and Urban
Poverty Alleviation, there are 10 million street vendors like Dinesh in India—600,000 just in Delhi.

<a href="https://www.dignityunbound.org/doing-development-differently-india-from-floor-to-sky-a-street-vendor-in-india-finds-his-voice/index.html">Read more</a>

</p>
            </Carousel.Caption>
          </Carousel.Item>
          <Carousel.Item style={{height:"200px"}}>
            {/* <img
              // className="d-block w-100"
              src="image.png"
              // src="holder.js/800x400?text=Third slide&bg=20232a"
              alt="Third slide"
            /> */}

            <Carousel.Caption style={{backgroundColor:"black",opacity:"80%"}}>
              <h3>Street vendor turned crorepati</h3>
              <p>
              Venkatesh Iyer, the founder of Goli Vada Pav, started his adventure with this venture in 2004. 18 years down the line, the business grew to 350+ outlets, expanding in 20 states and 100 cities. Venky always emphasized ensuring that the taste remained exactly the same in each and every outlet. He got inspiration from the stories of Narayan Murthy while starting his own business. Top business schools like Harvard business school, ISB Hyderabad practices case studies today on Venkatesh Iyer and his Rs 50 crore food business.
              <a href="https://curlytales.com/these-street-vendors-in-mumbai-turned-crorepatis-by-selling-vada-pav/">Read More</a>
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
