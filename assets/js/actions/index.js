import socket from "../socket"
let channel = socket.channel("slack_message:lobby", {})

export const JOIN_CHANNEL = 'JOIN_CHANNEL';
export const joinChannel = (status) => {
  return {type: JOIN_CHANNEL, status: status};
}
export const joinChannelAsync = () => {
  return (dispatch) => {
    channel.join()
      .receive("ok", resp => {
        dispatch(joinChannel('success'));
      })
      .receive("error", resp => {
        dispatch(joinChannel('fail'));
      });
    channel.on('message_created', (message) => {
      dispatch(receiveMessage(message));
    });
    channel.on('user_created', (user) => {
      dispatch(receiveUser(user));
    });
  };
}

export const RECEIVE_MESSAGE = 'receive_message';
export const receiveMessage = (message) => {
  return {
    type: RECEIVE_MESSAGE,
    message: message
  };
}

export const RECEIVE_USER = 'receive_user';
export const receive_user = (user) => {
  return {
    type: RECEIVE_USER,
    user: user
  };
}