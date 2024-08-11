import React from 'react';

const Footer = () => {
  return(
    <footer>
      <ul id="footer-nav">
        <li>
          <a className="footer-nav-item" href="/about">About</a>
        </li>
        <li>
          <a className="footer-nav-item" href="/privacy">Privacy</a>
        </li>
        <li>
          <a className="footer-nav-item" 
            target="_blank" 
            rel="noopener noreferrer" 
            href="https://www.linkedin.com/in/mitchell-wold">
            Contact
          </a>
        </li>
      </ul>
      <div>&copy; 2021 by Mitchell Wold</div>
    </footer>
  );
};

export default Footer;