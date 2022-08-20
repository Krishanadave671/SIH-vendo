import React from 'react';
const Tags = ({ Text = 'text' }) => {
    let color = "yellow";
    if(Text=="harrasement") color = "blue";
    else if(Text == "WaterClogging" ) color = "orange";
    else if(Text == "waterClogging") color = "red";

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
            marginRight:"4px",
            textAlign:"center",
        }}
        >{Text}</div>

	);
};

export default Tags;