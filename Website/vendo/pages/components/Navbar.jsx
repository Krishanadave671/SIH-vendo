import React from 'react';
// import '../../styles/Navbar.components.css';

const NavLinks = () => (
	<React.Fragment>
		
		{/* <p><a href="/">Product</a></p> */}
		{/* <p><a href="/">Community</a></p> */}
		<p><a href="/">Change Language</a></p>
		<p><a href="/">Contact Us</a></p>
		<p><a href="/government_login">Government Login</a></p>
	</React.Fragment>
);

const Navbar = () => {
	return (
		<div className="landing-navbar">
			<div className="landing-navbar-logo">
				{/* <img src={logo} alt="aankh-logo" /> */}
			</div>
			<div className="landing-navbar-links">
				<NavLinks />
			</div>
		</div>
	);
};

export default Navbar;