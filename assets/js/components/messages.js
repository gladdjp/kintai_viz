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
            this.props.messages.slice(0, 4).map((message) => {
              return (
                <CSSTransition key={message.message} timeout={300} className='message-wrapper'>
                  <Message key={message.message} slackUserId={message.slack_user_id} message={message.message} />
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

export default connect(mapStateToProps, null)(Messages);
