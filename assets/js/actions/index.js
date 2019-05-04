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
        console.log("ok");
        dispatch(joinChannel('success'));
      })
      .receive("error", resp => {
        dispatch(joinChannel('fail'));
      });
    channel.on('message_created', (message) => {
      console.log('new message: ', message);
      dispatch(receiveMessage(message));
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