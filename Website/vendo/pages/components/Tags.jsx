import React from 'react';
const Tags = ({ Text = 'text' }) => {
    let color = "yellow";
    if(Text=="sanitation") color = "blue";
    else if(Text == "water quality" ) color = "orange";
    else if(Text == "hygiene") color = "red";

	return (
		<div
        style={{
            display:"inline-block",
            // height:"32px",
            borderRadius:"32px",
            padding:"8px 32px",
            backgroundColor:color,
            color:"white",
            fontWeight:"bold",
            margin:"4px 2px",
            textAlign:"center",
        }}
        >{Text}</div>

	);
};

export default Tags;