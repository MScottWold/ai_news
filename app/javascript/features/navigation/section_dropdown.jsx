import React, { useState } from 'react';
import { NavLink } from 'react-router-dom';

const SectionDropdown = () => {
  const [showDropdown, setDropdown] = useState(false);

  let menu;
  if (showDropdown) {
    menu = (
      <ul id="section-dropdown"
        onMouseLeave={() => setDropdown(false)}
        onClick={() => setDropdown(false)}>
        <li className="section-dropdown-item">
          <NavLink to="/us" activeStyle={{ textDecoration: "underline" }}>
            U.S.
          </NavLink>
        </li>
        <li className="section-dropdown-item">
          <NavLink to="/politics" activeStyle={{ textDecoration: "underline" }}>
            Politics
          </NavLink>
        </li>
        <li className="section-dropdown-item">
          <NavLink to="/business" activeStyle={{ textDecoration: "underline" }}>
            Business
          </NavLink>
        </li>
        <li className="section-dropdown-item">
          <NavLink to="/sports" activeStyle={{ textDecoration: "underline" }}>
            Sports
          </NavLink>
        </li>
        <li className="section-dropdown-item">
          <NavLink to="/archives" activeStyle={{ textDecoration: "underline" }}>
            Archives
          </NavLink>
        </li>
      </ul>
    );
  }
  return (
    <div id="hamburger-box">
      <button
        id="hamburger-icon"
        onClick={() => setDropdown(!showDropdown)}></button>
      {menu}
    </div>
  )
};

export default SectionDropdown;
