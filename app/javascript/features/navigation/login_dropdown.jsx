import React from "react";
import { modalDisplayed } from "./ui_slice";
import { useDispatch } from "react-redux";
import { logOut } from "../session/session_slice";

const LoginDropdown = ({ loggedIn, setDropdown }) => {
  const dispatch = useDispatch();

  const menuItems = loggedIn ? (
    <>
      <li>
        <a href="#/favorites"
          className="login-dropdown-item">favorites</a>
      </li>
      <li>
        <a className="login-dropdown-item" onClick={() => dispatch(logOut())}>log out</a>
      </li>
    </>
  ) : (
    <>
      <li>
        <a className="login-dropdown-item"
          onClick={() => dispatch(modalDisplayed("login"))}>log in</a>
      </li>
      <li>
        <a className="login-dropdown-item"
          onClick={() => dispatch(modalDisplayed("signup"))}>sign up</a>
      </li>
    </>
  );

  return (
    <ul id="login-dropdown"
      onClick={() => setDropdown(false)}
      onMouseLeave={() => setDropdown(false)}>
      {menuItems}
    </ul>
  );
}

export default LoginDropdown;
