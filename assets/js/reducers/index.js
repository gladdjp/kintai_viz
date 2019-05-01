import {
  RECEIVE_MESSAGE
} from '../actions/index'

const defaultState = {
  messages: []
}

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case RECEIVE_MESSAGE:
      let updated_messages = state.messages.concat(action.message);
      return Object.assign({}, state, {messages: updated_messages});

    default:
      return state
  }
}

export default reducer
