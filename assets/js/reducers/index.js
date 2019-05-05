import {
  JOIN_CHANNEL,
  RECEIVE_MESSAGE,
  RECEIVE_USER
} from '../actions/index'

const defaultState = {
  messages: [],
  users: {},
  status: 'nothing'
}

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHANNEL:
      // let updated_messages = state.messages.concat(action.message);
      // return Object.assign({}, state, {messages: updated_messages});
      return Object.assign({}, state, {status: action.status});
    case RECEIVE_MESSAGE:
      let updated_messages = [action.message].concat(state.messages);
      return Object.assign({}, state, {messages: updated_messages});
    case RECEIVE_USER:
      let user = action.user;
      let updated_users = Object.assign({}, state.users, {[user.slack_user_id]: user})
      return Object.assign({}, state, {users: updated_users})
    default:
      return state;
  }
}

export default reducer
