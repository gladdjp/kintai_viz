import React, { Component } from 'react';
import {connect} from 'react-redux';
import { CSSTransition, TransitionGroup } from 'react-transition-group';

import UserAvatar from './user_avatar';
import Message from './message';

class Messages extends Component {
  render() {
    return (
      <div className='messages'>
        <TransitionGroup>
          {
            this.props.messages.map((message) => {
              return (
                <CSSTransition key={message.message} timeout={300} className='message-wrapper'>
                  <Message key={message.message} user={message.user} message={message.message} />
                </CSSTransition>
              );
            })
          }
        </TransitionGroup>
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