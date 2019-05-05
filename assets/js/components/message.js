import React, { Component } from 'react';
import {connect} from 'react-redux';

import UserAvatar from './user_avatar';

class Message extends Component {
  render() {
    console.log("message props", this.props);
    return (
      <div className='message'>
        <UserAvatar slackUserId={this.props.slackUserId} />
        <div className='message-content'>{this.props.message}</div>
      </div>
    )
  }
}

export default Message;