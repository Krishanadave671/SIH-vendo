import React from 'react';
const CommonInput = ({ placeholderText = 'Input', value, onChange, type = 'text' }) => {
	return (
		<input
			type={type}
			placeholder={placeholderText}
			value={value}
			onChange={onChange}
            style={{marginTop:"20px"}}
		/>
	);
};

export default CommonInput;