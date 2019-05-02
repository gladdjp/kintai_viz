import React, { Component } from 'react';
import UserAvatar from './user_avatar';

class Timeline extends Component {
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
          {this.renderSlots('13:00', ['a'])}
          {this.renderSlots('13:30', ['b', 'c'])}
          {this.renderSlots('14:00', ['d'])}
          {this.renderSlots('14:30', ['e'])}
        </div>
      </div>
    );
  }
}

export default Timeline;
