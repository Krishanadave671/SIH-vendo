import React from 'react';
import { slide as Menu } from 'react-burger-menu';
export default props => {
  return (
    <Menu>
      <a className="menu-item" href="/dashboard">Home</a>
      <a className="menu-item" href="/vendor_registration">Vendor Registration</a>
      <a className="menu-item" href="/customer_complaints">Customer Complaints</a>
      <a className="menu-item" href="/vendor_complaints">Vendor Complaints</a>
    </Menu>
  );
};