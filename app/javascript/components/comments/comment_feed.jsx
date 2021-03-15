import React from 'react';
import CommentList from './comment_list';

class CommentFeed extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      hasAllComments: false,
      loadingAll: true,
      loadingNewer: false,
      loadingOlder: false
     }
    this.bucketSize = 10;
    this.additionalCommentCheck = this.additionalCommentCheck.bind(this);
  }

  additionalCommentCheck(comments) {
    if (comments.length < this.bucketSize) {
      this.setState({ 
        hasAllComments: true,
        loadingAll: false,
        loadingNewer: false,
        loadingOlder: false
      });
    } else {
      this.setState({
        loadingAll: false,
        loadingOlder: false
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
      this.setState({ loadingOlder: true })
      this.props.getOlderComments(lastId)
        .then(this.additionalCommentCheck);
    };
  }

  fetchNewerComments(comments) {
    const firstId = comments[0] ? comments[0].id : 0;

    return (e) => {
      this.setState({ loadingNewer: true })
      e.preventDefault();
      this.props.getNewerComments(firstId)
        .then(() => this.setState({ loadingNewer: false }));
    };
  }

  render() {
    const { comments } = this.props;
    const loadingSpinner = <div className="loading-spinner"></div>;

    if (this.state.loadingAll) {
      return loadingSpinner;
    }

    const olderCommentsButton = this.state.hasAllComments ? (
        null
      ) : (
        <button onClick={this.fetchOlderComments(comments)}>
          Load More Comments
        </button>
      );

    return (
      <div id="comment-feed">
        <button 
          className={`refresh-comments ${this.state.loadingNewer ? "spin" : ""}`} 
          onClick={this.fetchNewerComments(comments)}></button>
        <CommentList comments={comments} />
        {this.state.loadingOlder ? loadingSpinner : olderCommentsButton}
      </div>
    );
  };
}

export default CommentFeed;