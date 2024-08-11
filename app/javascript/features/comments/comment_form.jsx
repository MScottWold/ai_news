import React, { useState } from "react";

const CommentForm = ({ addComment }) => {
  const [body, updateBody] = useState("");

  const handleFormChange = (e) => {
    updateBody(e.currentTarget.value);
  };

  const handleFormSubmit = (e) => {
    e.preventDefault();

    if (!body) return;

    const form = e.currentTarget;
    const button = form.querySelector('input[type="submit"]');
    button.disabled = true;
    addComment(body)
      .then(() => {
        form.reset();
        updateBody("");
        button.disabled = false;
      });
  };

  return (
    <form onSubmit={handleFormSubmit} className="comment-form">
      <textarea
        onChange={handleFormChange}
        placeholder="comment..."></textarea>
      <input type="submit" value="" />
    </form>
  );
};

export default CommentForm;
