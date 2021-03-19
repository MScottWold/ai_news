import React from 'react';

const CommentList = ({ comments }) => {
  const commentList = comments.length > 0 ? (
    comments.map(comment => (
      <li className="comment" key={comment.id}>
        <ul>
          <li className="comment-author">From: {comment.author}</li>
          <li>{comment.body}</li>
          <li className="comment-date">
            {new Date(comment.date).toLocaleString('en-US')}
          </li>
        </ul>
      </li>
    ))
  ) : (
    <li id="no-comments">No comments yet</li>
  );
  
  return (
    <ul className="comment-list">
      {commentList}
    </ul>
  );
};

export default CommentList;