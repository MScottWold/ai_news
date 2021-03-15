import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: '',
      password: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(input) {
    return (e) => this.setState({ [input]: e.currentTarget.value })
  }

  handleSubmit(e) {
    e.preventDefault();
    e.stopPropagation();
    if (!this.state.username || !this.state.password) return
    this.props.submitFormData({ user: this.state });
  }

  render() {
    const { errors } = this.props;
    let errorList;
    if (errors.length > 0) {
      errorList = (
        <ul id="error-messages">
          {errors.map((error, idx) => <li key={idx}>{error}</li>)}
        </ul>
      )
    }

    return (
      <form id="session-form" onSubmit={this.handleSubmit}>
        <input 
          type="text" 
          id="username" 
          placeholder="username"
          value={this.state.username}
          onChange={this.handleChange('username')}/>
        <input type="password" 
          id="password"
          placeholder="password"
          value={this.state.password}
          onChange={this.handleChange('password')}/>
        <input type="submit" value={this.props.submitText}/>
        {errorList}
      </form>
    );
  }
}

export default SessionForm;