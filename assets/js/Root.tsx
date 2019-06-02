import * as React from 'react'
import { BrowserRouter, Route, Switch, withRouter } from 'react-router-dom'

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import { Provider } from 'react-redux'
import { createStore } from 'redux'

import { defaultStore } from './store'
import askAGatorRed from './store/reducers'

import HomePage from './pages/index';
import LoginPage from './pages/LoginPage';
import SignUpPage from './pages/SignUpPage';
import Header from './components/Header';

const client = new ApolloClient({
  uri: 'http://localhost:4000/api',
  fetchOptions: {
    credentials: 'include'
  },
  onError: ({ graphQLErrors, networkError }) => {
    // Do something with the errors lol
  }
});

const store = createStore(askAGatorRed, defaultStore)

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <Provider store={store}>
        <BrowserRouter>
          <ApolloProvider client={client}>
            <Header />
            <Switch>
              <Route exact path="/" component={HomePage} />
              <Route path="/login" component={withRouter(LoginPage)} />
              <Route path="/signup" component={withRouter(SignUpPage)} />
            </Switch>
          </ApolloProvider>
        </BrowserRouter>
      </Provider>
    )
  }
}
