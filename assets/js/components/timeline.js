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
          2 May 2019
        </div>
        <div className='slots'>
          {this.renderSlots('13:00', [])}
          {this.renderSlots('13:30', [])}
          {this.renderSlots('14:00', [])}
          {this.renderSlots('14:30', [])}
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
