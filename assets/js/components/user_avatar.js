import React, { Component } from 'react';
import {connect} from 'react-redux';

class UserAvatar extends Component {
  render() {
    return (
      <div className={`user-avatar`}>
        <img src={this.props.image_url} />
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {

  let image_url;
  let user = state.users[ownProps.slackUserId];
  if(user) {
    image_url = user.image_url;
  }
  let p = {
    image_url: image_url
  }
  return p;
}

export default connect(mapStateToProps, null)(UserAvatar);
