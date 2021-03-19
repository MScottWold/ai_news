import React, { useState, useEffect } from 'react';
import GreetingContainer from './greeting_container';
import SectionDropdown from './section_dropdown';
import { NavLink } from 'react-router-dom';

const Masthead = () => {
  const [sticky, setSticky] = useState(false);
  
  const handleScroll = (e) => {
    if (window.scrollY > 107) {
      setSticky(true);
    } else {
      setSticky(false);
    }
  };

  useEffect(() => window.addEventListener('scroll', handleScroll));

  return (
    <header id={sticky ? "header-sticky" : "header"}>
      <div id="masthead">
        <SectionDropdown />
        <div id="logo-box">
          <a href="/" className="logo">
            <span>T</span>HE <span>D</span>IGITAL <span>H</span>ERALD
          </a>
        </div>
        <GreetingContainer />
      </div>
      <nav id="sections">
        <NavLink to="/us" activeStyle={{ textDecoration: "underline" }}>U.S.</NavLink>
        <NavLink to="/politics" activeStyle={{ textDecoration: "underline" }}>Politics</NavLink>
        <NavLink to="/business" activeStyle={{ textDecoration: "underline" }}>Business</NavLink>
        <NavLink to="/sports" activeStyle={{ textDecoration: "underline" }}>Sports</NavLink>
        <NavLink to="/archives" activeStyle={{ textDecoration: "underline" }}>Archives</NavLink>
      </nav>
    </header>
  );
};

export default Masthead;