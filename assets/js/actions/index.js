import socket from "../socket"
let channel = socket.channel("slack_message:lobby", {})

export const JOIN_CHANNEL = 'JOIN_CHANNEL';
export const joinChannel = (status) => {
  return {type: JOIN_CHANNEL, status: status};
}
export const joinChannrlAsync = () => {
  return (dispatch) => {
    channel.join()
      .receive("ok", resp => {
        dispatch(joinChat('success'));
      })
      .receive("error", resp => {
        dispatch(joinChat('fail'));
      });
    channel.on('receive_message', (message) => {
      console.log('received: ', message);
      dispatch(receivedMessage(message));
    });
  }
}

export const RECEIVE_MESSAGE = 'receive_message';
export const receive_message = () => {
  return {
    type: RECEIVE_MESSAGE
  }
}