import React, { useState } from 'react';

const Greeting = ({ loggedIn, username, showModal, logout }) => {
  if (!loggedIn) {
    return (
      <div id="login-buttons">
        <button className="session-button" onClick={() => showModal('login')}>log in</button>
        <button className="session-button" onClick={() => showModal('signup')}>sign up</button>
      </div>
    );
  }

  const [dropdown, setDropdown ] = useState(false);

  const menu = dropdown ? (
    <ul className="dropdown" 
      onClick={() => setDropdown(false)}>
      <li className="menu-item"
        onClick={() => window.location.hash = '/favorites'}
        >favorites</li>
      <li className="menu-item" onClick={logout}>log out</li>
    </ul>
  ) : (
    null
  );
  
  return (
    <div className="greeting" onMouseLeave={() => setDropdown(false)}>
      <div>{username}</div>
      <div
        id="avatar"
        onMouseEnter={() => setDropdown(true)}>
      </div>
      {menu}
    </div>
  );
};

export default Greeting;