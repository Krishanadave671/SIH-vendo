import React from 'react';
const Highlighter = ({ Text = 'Input',fontSize = "1.2rem"}) => {
	return (
		<div style={{
            width:"fit-content",
            padding:"8px",
            borderRadius:"32px",
            fontSize:fontSize,
            fontWeight:"600",
            color:"white",
            backgroundColor:"var(--primary-color)",
            textAlign:"center",
            marginTop:"20px",
            marginBottom:"20px",
        }}>
            {Text}
        </div>
	);
};

export default Highlighter;