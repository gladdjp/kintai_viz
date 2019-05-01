import React, { Component } from 'react';
import { createStore, applyMiddleware, compose } from 'redux';
import { Provider } from 'react-redux';
import reducer from '../reducers/index';
import thunk from 'redux-thunk';

import Timeline from './timeline.js';

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

let store = createStore(
  reducer,
  composeEnhancers(applyMiddleware(thunk))
);

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <div>
          <div> Kintai Visualizer </div>
          <Timeline />
        </div>
      </Provider>
    );
  }
}

export default App;