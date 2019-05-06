import React, { Component } from 'react';
import UserAvatar from './user_avatar';
import {connect} from 'react-redux';
import {joinChannelAsync} from '../actions/index'

class Timeline extends Component {
  componentDidMount() {
    this.props.onMount();
  }

  renderSlots(label, items) {
    return (
      <div className='slot'>
        <div className='slot-label'>
          {label}
        </div>
        <div className='slot-items'>
          {items.map((i) => (<UserAvatar name={i} key={i} />))}
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
          {this.renderSlots('15:00', [])}
          {this.renderSlots('15:30', [])}
          {this.renderSlots('16:00', [])}
          {this.renderSlots('16:30', [])}
          {this.renderSlots('17:00', [])}
          {this.renderSlots('17:30', [])}
          {this.renderSlots('18:00', [])}
          {this.renderSlots('18:30', [])}
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    status: state.status
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
