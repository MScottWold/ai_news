import React, { useState } from "react";
import { useSelector } from "react-redux";
import LoginDropdown from "./login_dropdown";


const Greeting = () => {
  const username = useSelector((state) => state.session.currentUser);
  const loggedIn = !!username;
  const [showDropdown, setDropdown] = useState(false);

  let displayName = username;
  if (loggedIn && username.length > 15) {
    displayName = username.slice(0, 12) + "...";
  }

  return (
    <div id="greeting-box">
      {loggedIn && <div id="hello-user">{displayName}</div>}
      <button
        id={`avatar-${ loggedIn ? "login" : "logout"}`}
        onClick={() => setDropdown(!showDropdown)}>
      </button>
      {showDropdown && <LoginDropdown loggedIn={loggedIn} setDropdown={setDropdown} />}
    </div>
  );
};

export default Greeting;
