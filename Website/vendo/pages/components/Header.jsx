import React from 'react';
import styles from "../../styles/Home.module.css";
import Imag1 from "../../Images/Photo_transparent.png";
import Imag2 from "../../Images/profileimage.png";
import Image from 'next/image';



function Header() {
  return (
    <div className='HeaderContainer'>
        <div className='HeaderWrapper'>
            <div className='Title'>
               <h2>
                    Hello,<span> Piush!</span> 
               </h2> 
               <p>Welcome to your board.</p>
            </div>    
        </div>
        <div className='Profile'>
            <Image src={Imag2} alt="ProfileImage" className='image' ></Image>
        </div>
        
    </div>
    

    
    
  );
}

export default Header