import {
  JOIN_CHANNEL,
  RECEIVE_MESSAGE,
  RECEIVE_USER
} from '../actions/index'

const defaultState = {
  messages: [],
  users: {},
  status: 'nothing',
  kintais: {
    '15:00': [],
    '15:30': [],
    '16:00': [],
    '16:30': [],
    '17:00': [],
    '17:30': [],
    '18:00': [],
    '18:30': []
  }
}

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHANNEL:
      // let updated_messages = state.messages.concat(action.message);
      // return Object.assign({}, state, {messages: updated_messages});
      return Object.assign({}, state, {status: action.status});
    case RECEIVE_MESSAGE:
      let updated_messages = [action.message].concat(state.messages);
      let kintais = state.kintais;
      if (action.message.kintai_time) {
        kintais[action.message.kintai_time].push(action.message.slack_user_id)
      }
      return Object.assign({}, state, {messages: updated_messages, kintais: kintais});
    case RECEIVE_USER:
      let user = action.user;
      let updated_users = Object.assign({}, state.users, {[user.slack_user_id]: user})
      return Object.assign({}, state, {users: updated_users})
    default:
      return state;
  }
}

export default reducer
