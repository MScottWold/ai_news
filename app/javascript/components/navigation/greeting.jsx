import React, { useState } from 'react';

const Greeting = ({ loggedIn, username, showModal, logout }) => {
  const [showDropdown, setDropdown ] = useState(false);

  let menu;
  if (showDropdown) {
    menu = loggedIn ? (
      <ul id="login-dropdown" 
        onClick={() => setDropdown(false)}
        onMouseLeave={() => setDropdown(false)}>
        <li className="login-dropdown-item"
          onClick={() => window.location.hash = '/favorites'}>
          favorites
        </li>
        <li className="login-dropdown-item" onClick={logout}>
          log out
        </li>
      </ul>
    ) : (
      <ul id="login-dropdown" 
        onClick={() => setDropdown(false)}
        onMouseLeave={() => setDropdown(false)}>
        <li className="login-dropdown-item" onClick={() => showModal('login')}>
          log in
        </li>
        <li className="login-dropdown-item" onClick={() => showModal('signup')}>
          sign up
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
      <div
        id={`avatar-${ loggedIn ? 'login' : 'logout'}`}
        onClick={() => setDropdown(!showDropdown)}>
      </div>
      {menu}
    </div>
  );
};

export default Greeting;