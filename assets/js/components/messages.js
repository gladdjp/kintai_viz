import React, { Component } from 'react';
import {connect} from 'react-redux';

import UserAvatar from './user_avatar';
import Message from './message';

class Messages extends Component {
  render() {
    return (
      <div className='messages'>
        <Message user='a' message='have a nice day' />
        {this.props.messages.map((message) => <Message key={message.message} user={message.user} message={message.message} />)}
      </div>
    )
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    messages: state.messages
  };
}

const mapDistpatchToProps = (dispatch, ownProps) => {
  return {

  };
}

export default connect(mapStateToProps, mapDistpatchToProps)(Messages);