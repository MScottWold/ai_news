import React, { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { modalDisplayed } from "./ui_slice";
import { logOut } from "../session/session_slice";

const Greeting = () => {
  const username = useSelector((state) => state.session.currentUser);
  const loggedIn = !!username;

  const dispatch = useDispatch();

  const [showDropdown, setDropdown] = useState(false);

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
          <a className="login-dropdown-item" onClick={() => dispatch(logOut())}>log out</a>
        </li>
      </ul>
    ) : (
      <ul id="login-dropdown"
        onClick={() => setDropdown(false)}
        onMouseLeave={() => setDropdown(false)}>
        <li>
          <a className="login-dropdown-item"
            onClick={() => dispatch(modalDisplayed("login"))}>log in</a>
        </li>
        <li>
          <a className="login-dropdown-item"
            onClick={() => dispatch(modalDisplayed("signup"))}>sign up</a>
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
        id={`avatar-${ loggedIn ? "login" : "logout"}`}
        onClick={() => setDropdown(!showDropdown)}>
      </button>
      {menu}
    </div>
  );
};

export default Greeting;
