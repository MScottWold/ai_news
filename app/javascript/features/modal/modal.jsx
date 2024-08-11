import React from "react";
import { useDispatch } from "react-redux";
import { modalHidden } from "../navigation/ui_slice";
import SessionForm from "./session_form";


const Modal = ({ modalType }) => {
  const dispatch = useDispatch();

  return (
    <div id="modal-mask" onClick={() => dispatch(modalHidden())}>
      <div id="modal-container" onClick={(e) => e.stopPropagation()}>
        <button id="hide-modal" onClick={() => dispatch(modalHidden())}>X</button>
        <SessionForm modalType={modalType}/>
      </div>
    </div>
  )
};

export default Modal;
