import React from 'react';
import GreetingContainer from './greeting_container';
import { NavLink } from 'react-router-dom';

const Masthead = () => {
  return (
    <header>
      <GreetingContainer />
      <h1 
        id="logo"
        onClick={() => location.hash = '/'}>
        The Digital Herald
      </h1>
      <ul id="sections">
        <li><NavLink to="/us" activeStyle={{ textDecoration: "underline" }}>U.S.</NavLink></li>
        <li><NavLink to="/politics" activeStyle={{ textDecoration: "underline" }}>Politics</NavLink></li>
        <li><NavLink to="/business" activeStyle={{ textDecoration: "underline" }}>Business</NavLink></li>
        <li><NavLink to="/sports" activeStyle={{ textDecoration: "underline" }}>Sports</NavLink></li>
        <li><NavLink to="/archives" activeStyle={{ textDecoration: "underline" }}>Archives</NavLink></li>
      </ul>
    </header>
  );
};

export default Masthead;