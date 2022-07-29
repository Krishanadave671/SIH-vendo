import React from 'react';
import { slide as Menu } from 'react-burger-menu';
export default props => {
  return (
    <Menu>
      <a className="menu-item" href="/dashboard">Vendor Registration</a>
      <a className="menu-item" href="/dashboard">Customer Complaints</a>
      <a className="menu-item" href="/dashboard">Vendor Complaints</a>
    </Menu>
  );
};