import * as React from 'react'
import { BrowserRouter, Route, Switch, withRouter } from 'react-router-dom'
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import { AUTH_TOKEN } from './constants';

import HomePage from './pages/index';
import LoginPage from './pages/LoginPage';
import Header from './components/Header';

const client = new ApolloClient({
  uri: 'http://localhost:4000/api',
  fetchOptions: {
    credentials: 'include'
  },
  request: async (operation) => {
    const token = await localStorage.getItem(AUTH_TOKEN);
    operation.setContext({
      headers: {
        authorization: token ? `Bearer ${token}` : "",
      }
    });
  },
  onError: ({ graphQLErrors, networkError }) => {
    // Do something with the errors lol
  }
});

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <BrowserRouter>
        <ApolloProvider client={client}>
          <Header/>
          <Switch>
            <Route exact path="/" component={HomePage} />
            <Route path="/login" component={withRouter(LoginPage)} />
          </Switch>
        </ApolloProvider>
      </BrowserRouter>
    )
  }
}
