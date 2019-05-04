import React, { Component } from 'react';
import {connect} from 'react-redux';

import UserAvatar from './user_avatar';

class Messages extends Component {
  render() {
    return (
      <div className='messages'>
        <div className='message'>
          <UserAvatar name='a' />
          <div className='message-content'>Hello dude!</div>
        </div>
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