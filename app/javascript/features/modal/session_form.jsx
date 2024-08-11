import React, { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { signUp, logIn } from "../session/session_slice";

const useStateSetter = (stateSetter) => {
  return (e) => stateSetter(e.currentTarget.value)
}

const modalSubmitText = { login: "log in", signup: "sign up" }

const SessionForm = ({ modalType }) => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const errors = useSelector((state) => state.session.errors) || [];

  const submitText = modalSubmitText[modalType];

  const dispatch = useDispatch();

  const handleSessionSubmit = (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (!username || !password) return

    if (modalType == "login") {
      dispatch(logIn({ user: { username: username, password: password } }))
    } else if (modalType == "signup") {
      dispatch(signUp({ user: { username: username, password: password } }))
    }
  };

  let errorList;
  if (errors.length > 0) {
    errorList = (
      <ul id="error-messages">
        {errors.map((error, idx) => <li key={idx}>{error}</li>)}
      </ul>
    )
  }

  return (
    <form id="session-form" onSubmit={handleSessionSubmit}>
      <input
        type="text"
        id="username"
        placeholder="username"
        value={username}
        onChange={useStateSetter(setUsername)} />
      <input
        type="password"
        id="password"
        placeholder="password"
        value={password}
        onChange={useStateSetter(setPassword)} />
      <input
        type="submit"
        className="button"
        tabIndex="0"
        value={submitText} />
      {errorList}
    </form>
  );

}

export default SessionForm;
