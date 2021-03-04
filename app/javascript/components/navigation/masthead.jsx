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
        <li><NavLink to="/section/us" activeStyle={{ textDecoration: "underline" }}>U.S.</NavLink></li>
        <li><NavLink to="/section/politics" activeStyle={{ textDecoration: "underline" }}>Politics</NavLink></li>
        <li><NavLink to="/section/business" activeStyle={{ textDecoration: "underline" }}>Business</NavLink></li>
        <li><NavLink to="/section/sports" activeStyle={{ textDecoration: "underline" }}>Sports</NavLink></li>
      </ul>
    </header>
  );
};

export default Masthead;