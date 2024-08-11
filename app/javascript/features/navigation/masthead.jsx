import React, { useState, useEffect } from "react";
import Greeting from "./greeting";
import SectionDropdown from "./section_dropdown";
import { NavLink } from "react-router-dom";

const navLinkStyling = ({ isActive }) => (
  { textDecoration: isActive ? "underline" : "none" }
);

const Masthead = () => {
  const [sticky, setSticky] = useState(false);

  const handleScroll = (e) => {
    if (window.scrollY > 82) {
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
            <span>T</span>HE <span>B</span>ANNER <span>W</span>EEKLY
          </a>
        </div>
        <Greeting />
      </div>
      <nav id="sections">
        <NavLink to="/us" style={navLinkStyling}>U.S.</NavLink>
        <NavLink to="/politics" style={navLinkStyling}>Politics</NavLink>
        <NavLink to="/business" style={navLinkStyling}>Business</NavLink>
        <NavLink to="/sports" style={navLinkStyling}>Sports</NavLink>
        <NavLink to="/archives" style={navLinkStyling}>Archives</NavLink>
      </nav>
    </header>
  );
};

export default Masthead;
