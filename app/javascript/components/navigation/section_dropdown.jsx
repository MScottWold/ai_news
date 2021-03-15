import React, { useState } from 'react';
import { NavLink } from 'react-router-dom';

const SectionDropdown = () => {
  const [showDropdown, setDropdown] = useState(false);

  let menu;
  if (showDropdown) {
    menu = (
      <ul id="section-dropdown" onClick={() => setDropdown(false)}>
        <li className="section-dropdown-items">
          <NavLink to="/us" activeStyle={{ textDecoration: "underline" }}>
            U.S.
          </NavLink>
        </li>
        <li className="section-dropdown-items">
          <NavLink to="/politics" activeStyle={{ textDecoration: "underline" }}>
            Politics
          </NavLink>
        </li>
        <li className="section-dropdown-items">
          <NavLink to="/business" activeStyle={{ textDecoration: "underline" }}>
            Business
          </NavLink>
        </li>
        <li className="section-dropdown-items">
          <NavLink to="/sports" activeStyle={{ textDecoration: "underline" }}>
            Sports
          </NavLink>
        </li>
        <li className="section-dropdown-items">
          <NavLink to="/archives" activeStyle={{ textDecoration: "underline" }}>
            Archives
          </NavLink>
        </li>
      </ul>
    );
  }
  return (
    <div id="hamburger-box">
      <div id="hamburger-icon" onClick={() => setDropdown(!showDropdown)}></div>
      {menu}
    </div>
  )
};

export default SectionDropdown;