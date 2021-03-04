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
    this.props.submitFormData({ user: this.state });
  }

  render() {
    const { errors, hideModal } = this.props;
    const errorList = errors.map((error, idx) => (
      <p key={idx} className="error-message">{error}</p>
    ));

    return (
      <div id="modal-mask" onClick={() => hideModal()}>
        <div id="modal-container" onClick={(e) => e.stopPropagation()}>
          <div id="hide-modal" onClick={() => hideModal()}>x</div>
          <form id="session-form" onSubmit={this.handleSubmit}>
            <label htmlFor="username">Username</label>
            <input 
              type="text" 
              id="username" 
              value={this.state.username}
              onChange={this.handleChange('username')}/>
            <label htmlFor="password">Password</label>
            <input type="password" 
              id="password"
              value={this.state.password}
              onChange={this.handleChange('password')}/>
            <input type="submit" value={this.props.submitText}/>
          </form>
          {errorList}
        </div>
      </div>
    );
  }
}

export default SessionForm;