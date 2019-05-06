import React, { Component } from 'react';
import UserAvatar from './user_avatar';
import {connect} from 'react-redux';
import {joinChannelAsync} from '../actions/index'

class Timeline extends Component {
  componentDidMount() {
    this.props.onMount();
  }

  renderSlots(label, slackUserIds) {
    return (
      <div className='slot'>
        <div className='slot-label'>
          {label}
        </div>
        <div className='slot-items'>
          {slackUserIds.map((slackUserId) => {
              return (
                <UserAvatar key={slackUserId} slackUserId={slackUserId} />
              )
            })
          }
        </div>
      </div>
    );
  }
  render() {
    return (
      <div className='timeline'>
        <div className='date'>
          {(new Date()).toLocaleDateString()}
        </div>
        <div className='slots'>
          {this.renderSlots('15:00', this.props.kintais['15:00'])}
          {this.renderSlots('15:30', this.props.kintais['15:30'])}
          {this.renderSlots('16:00', this.props.kintais['16:00'])}
          {this.renderSlots('16:30', this.props.kintais['16:30'])}
          {this.renderSlots('17:00', this.props.kintais['17:00'])}
          {this.renderSlots('17:30', this.props.kintais['17:30'])}
          {this.renderSlots('18:00', this.props.kintais['18:00'])}
          {this.renderSlots('18:30', this.props.kintais['18:30'])}
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    status: state.status,
    messages: state.messages, // Need this or it wont update.
    kintais: state.kintais
  };
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onMount: () => {
      dispatch(joinChannelAsync());
    }
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Timeline);
