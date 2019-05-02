import React, { Component } from 'react';

class UserAvatar extends Component {
  render() {
    return (
      <div className={`user-avatar user-${this.props.name}`} key={this.props.name}></div>
    );
  }
}

export default UserAvatar;
