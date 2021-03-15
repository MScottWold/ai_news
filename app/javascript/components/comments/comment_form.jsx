import React from 'react';

class CommentForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      article_id: this.props.articleId,
      body: ''
    };
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateBody(e) {
    this.setState({
      body: e.currentTarget.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    
    const form = e.currentTarget;
    if (!this.state.body) return
    const button = form.querySelector('input[type="submit"]');
    
    button.disabled = true;
    
    this.props.postComment(this.state)
      .then(() => {
        form.reset();
        this.setState({ body: '' })
        button.disabled = false;
      });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className="comment-form">
        <textarea 
          onChange={this.updateBody}
          placeholder="comment..."></textarea>
        <input type="submit" value=""/>
      </form>
    );
  }
}

export default CommentForm;