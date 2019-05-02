import React, { Component } from 'react';

class Timeline extends Component {
  renderSlots(label, items) {
    return (
      <div className='slot'>
        <div className='slot-label'>
          {label}
        </div>
        <div className='slot-items'>
          {items.map((i) => (<div key={i}> {i} </div>))}
        </div>
      </div>
    );
  }
  render() {
    return (
      <div className='timeline'>
        <div className='date'>
          <div className='date-month'>
            2 May
          </div>
          <div className='year'>
            2019
          </div>
        </div>
        <div className='slots'>
          {this.renderSlots('13:00', ['a', 'b', 'c'])}
          {this.renderSlots('13:30', ['a', 'b', 'c'])}
          {this.renderSlots('14:00', ['a', 'b', 'c'])}
          {this.renderSlots('14:30', ['a', 'b', 'c'])}
        </div>
      </div>
    );
  }
}

export default Timeline;
