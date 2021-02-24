import React from 'react';
import { NavLink } from 'react-router-dom';

const Navigation = () => {
  return (
    <header>
      <h1 
        id="logo"
        onClick={() => location.hash = '/'}>
        The Digital Herald
      </h1>
      <ul id="sections">
        <li><NavLink to="/section/us" activeStyle={{ textDecoration: "underline" }}>U.S.</NavLink></li>
        <li><NavLink to="/section/politics" activeStyle={{ textDecoration: "underline" }}>Politics</NavLink></li>
        <li><NavLink to="/section/business" activeStyle={{ textDecoration: "underline" }}>Business</NavLink></li>
        <li><NavLink to="/section/sports" activeStyle={{ textDecoration: "underline" }}>Sports</NavLink></li>
      </ul>
    </header>
  );
};

export default Navigation;