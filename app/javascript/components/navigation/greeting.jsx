import React from 'react';

const Greeting = ({ loggedIn, username, showModal, logout }) => {
  if (loggedIn) {
    return (
      <div className="greeting">
        <p>Welcome, {username}!</p>
        <a href="#/favorites">favorites</a>
        <button onClick={logout}>
          log out
        </button>
      </div>
    );
  }

  return (
    <div className="greeting">
      <button className="session-button" onClick={() => showModal('login')}>log in</button>
      <button className="session-button" onClick={() => showModal('signup')}>sign up</button>
    </div>
  );
};

export default Greeting;