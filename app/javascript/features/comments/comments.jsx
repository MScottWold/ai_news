import React, { useState, useEffect } from "react";
import { getComments, postComment } from "../../util/api_util";
import CommentFeed from "./comment_feed";
import CommentForm from "./comment_form";



const Comments = ({ articleId, loggedIn }) => {
  const [comments, updateComments] = useState([]);
  const [loadingComments, toggleLoadingComments] = useState(true);
  useEffect(() => {
    let ignore = false;
    updateComments([])
    getComments(articleId)
      .then(comments => {
        toggleLoadingComments(false);
        if (!ignore) {
          updateComments(comments);
        }
      });

    return () => {
      ignore = true;
    };
  }, []);

  const addComment = async (body) => {
    return postComment(articleId, body)
      .then((comment) => {
        if (comment) {
          updateComments([comment, ...comments])
        }
      });
  };

  const fetchComments = async (filter) => {
    return getComments(articleId, filter)
      .then(receivedComments => {
        if (receivedComments && filter.before) {
          updateComments([...comments, ...receivedComments])
        } else if (receivedComments && filter.after) {
          updateComments([...receivedComments, ...comments])
        }

        return receivedComments;
      })
  };

  return (
    <aside id="comments">
      <h3 className="subsection-title">Comments</h3>
      {loggedIn ? (
        <CommentForm addComment={addComment} />
      ) : (
        <p>Log in to post comments.</p>
      )}
      <CommentFeed
        comments={comments}
        fetchComments={fetchComments}
        loadingComments={loadingComments}
      />
    </aside>
  );
};

export default Comments;
