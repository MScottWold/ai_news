import React from 'react';
import CommentFeed from './comment_feed';
import CommentForm from './comment_form';

class Comments extends React.Component {
  render() {
    const { 
      comments, 
      getOlderComments, 
      getNewerComments,
      getComments,
      clearComments,
      postComment,
      articleId, 
      loggedIn 
    } = this.props;

    const newCommentForm = loggedIn ? (
      <CommentForm postComment={postComment} articleId={articleId}/>
    ) : (
      <p>Log in to post comments.</p>
    );

    return (
      <aside id="comments">
        <h3 className="subsection-title">Comments</h3>
        {newCommentForm}
        <CommentFeed 
          comments={comments} 
          getComments={getComments}
          clearComments={clearComments}
          getOlderComments={getOlderComments}
          getNewerComments={getNewerComments} />
      </aside>
    );
  }
}

export default Comments;