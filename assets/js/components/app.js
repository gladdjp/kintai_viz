import React, { Component } from 'react';
import { createStore, applyMiddleware, compose } from 'redux';
import { Provider } from 'react-redux';
import reducer from '../reducers/index';
import thunk from 'redux-thunk';

import Timeline from './timeline.js';
import Messages from './messages.js';

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

let store = createStore(
  reducer,
  composeEnhancers(applyMiddleware(thunk))
);

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <div className='main-wrapper'>
          <h1> Today's Kintai</h1>
          <Timeline />
          <Messages />
        </div>
      </Provider>
    );
  }
}

export default App;