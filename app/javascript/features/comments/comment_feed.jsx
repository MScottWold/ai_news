import React, { useState } from "react";
import CommentList from "./comment_list";
import LoadingSpinner from "../shared/loading_spinner";

const commentBucketSize = 10;

const CommentFeed = ({ comments, fetchComments, loadingComments }) => {
  const [hasAllComments, toggleHasAllComments] = useState(false);
  const [loadingNewer, toggleLoadingNewer] = useState(false)
  const [loadingOlder, toggleLoadingOlder] = useState(false);

  if (loadingComments) return <LoadingSpinner />;

  const fetchOlderComments = (e) => {
    e.preventDefault();
    toggleLoadingOlder(true);
    const lastId = comments[comments.length - 1].id;
    fetchComments({ before: lastId })
      .then((receivedComments) => {
        if (receivedComments.length < commentBucketSize) {
          toggleHasAllComments(true);
          toggleLoadingNewer(false);
        }
        toggleLoadingOlder(false);
      })
  };

  const fetchNewerComments = (e) => {
    e.preventDefault();
    toggleLoadingNewer(true);
    const firstId = comments[0] ? comments[0].id : 0;
    fetchComments({ after: firstId })
      .then(() => toggleLoadingNewer(false));
  };

  const olderCommentsButton = hasAllComments || comments.length == 0 ? (
    null
  ) : (
    <button className="button" onClick={fetchOlderComments}>
      Load Older Comments
    </button>
  );

  return (
    <div id="comment-feed">
      <button
        className={`refresh-comments ${loadingNewer ? "spin" : ""}`}
        onClick={fetchNewerComments}></button>
      <CommentList comments={comments} />
      {loadingOlder ? <LoadingSpinner /> : olderCommentsButton}
    </div>
  );
};

export default CommentFeed;
