import React, { useState } from 'react';

const Greeting = ({ loggedIn, username, showModal, logout }) => {
  const [showDropdown, setDropdown ] = useState(false);

  let menu;
  if (showDropdown) {
    menu = loggedIn ? (
      <ul id="login-dropdown" 
        onClick={() => setDropdown(false)}
        onMouseLeave={() => setDropdown(false)}>
        <li>
          <a href="#/favorites"
            className="login-dropdown-item">favorites</a>
        </li>
        <li>
          <a className="login-dropdown-item" onClick={logout}>log out</a>
        </li>
      </ul>
    ) : (
      <ul id="login-dropdown" 
        onClick={() => setDropdown(false)}
        onMouseLeave={() => setDropdown(false)}>
        <li>
          <a className="login-dropdown-item" 
            onClick={() => showModal('login')}>log in</a>
        </li>
        <li>
          <a className="login-dropdown-item" 
            onClick={() => showModal('signup')}>sign up</a>
        </li>
      </ul>
    );
  }

  let displayName = username;
  if (loggedIn && username.length > 15){
    displayName = username.slice(0, 12) + "...";
  }
  
  return (
    <div id="greeting-box">
      <div id="hello-user">{displayName}</div>
      <button
        id={`avatar-${ loggedIn ? 'login' : 'logout'}`}
        onClick={() => setDropdown(!showDropdown)}>
      </button>
      {menu}
    </div>
  );
};

export default Greeting;