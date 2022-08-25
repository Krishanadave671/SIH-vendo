import React from 'react';
const Tags = ({ Text = 'text' }) => {
    let color = "#4d4111";
    if(Text=="harrasement") color = "#1c1c20";
    else if(Text == "WaterClogging" ) color = "blue";
    else if(Text == "waterClogging") color = "skyblue";

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