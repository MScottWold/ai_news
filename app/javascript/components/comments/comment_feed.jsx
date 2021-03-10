import React from 'react';
import CommentList from './comment_list';

class CommentFeed extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      hasAllComments: false,
      loading: true
     }
    this.bucketSize = 10;
    this.additionalCommentCheck = this.additionalCommentCheck.bind(this);
  }

  additionalCommentCheck(comments) {
    if (comments.length < this.bucketSize) {
      this.setState({ 
        hasAllComments: true,
        loading: false
      });
    } else {
      this.setState({
        loading: false
      });
    }
  }

  componentDidMount() {
    this.props.getComments()
      .then((comments) => this.additionalCommentCheck(comments));
  }

  fetchOlderComments(comments) {
    const lastId = comments[comments.length - 1].id;

    return (e) => {
      e.preventDefault();
      const button = e.currentTarget;
      button.disabled = true;
      this.props.getOlderComments(lastId)
        .then(comments => {
          this.additionalCommentCheck(comments);
          button.disabled = false;
        });
    };
  }

  fetchNewerComments(comments) {
    const firstId = comments[0] ? comments[0].id : 0;

    return (e) => {
      const button = e.currentTarget;
      button.disabled = true;
      e.preventDefault();
      this.props.getNewerComments(firstId)
        .then(() => button.disabled = false);
    };
  }

  render() {
    const { comments } = this.props;

    if (this.state.loading) {
      return <p>Loading...</p>
    }

    const olderCommentsButton = this.state.hasAllComments ? (
        null
      ) : (
        <button onClick={this.fetchOlderComments(comments)}>
          Get More Comments
        </button>
      );

    return (
      <div>
        <button onClick={this.fetchNewerComments(comments)}>
          Refresh Comments
        </button>
        <CommentList comments={comments} />
        {olderCommentsButton}
      </div>
    );
  };
}

export default CommentFeed;