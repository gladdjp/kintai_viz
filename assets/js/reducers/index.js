import {
  JOIN_CHANNEL
} from '../actions/index'

const defaultState = {
  messages: [],
  status: 'nothing'
}

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHANNEL:
      // let updated_messages = state.messages.concat(action.message);
      // return Object.assign({}, state, {messages: updated_messages});
      return Object.assign({}, state, {status: action.status});
    default:
      return state;
  }
}

export default reducer
