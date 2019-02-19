import * as React from 'react'
import { BrowserRouter, Route, Switch, withRouter } from 'react-router-dom'
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import { InMemoryCache } from 'apollo-cache-inmemory';
import { HttpLink } from 'apollo-link-http';
import { onError } from 'apollo-link-error';
import { withClientState } from 'apollo-link-state';
import { ApolloLink, Observable } from 'apollo-link';

import HomePage from './pages/index';
import LoginPage from './pages/LoginPage';
import Header from './components/Header'

const client = new ApolloClient({
  uri: 'http://localhost:4000/api',
  fetchOptions: {
    credentials: 'include'
  },
  request: async (operation) => {
    const token = await localStorage.getItem('token');
    operation.setContext({
      headers: {
        authorization: token ? `Bearer ${token}` : "",
      }
    });
  },
  onError: ({ graphQLErrors, networkError }) => {
    // if (graphQLErrors) {
    //   sendToLoggingService(graphQLErrors);
    // }
    // if (networkError) {
    //   logoutUser();
    // }
  }
});

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <BrowserRouter>
        <ApolloProvider client={client}>
            <>
              <Header/>
              <Switch>
                <Route exact path="/" component={HomePage} />
                <Route path="/login" component={withRouter(LoginPage)} />
              </Switch>
            </>
        </ApolloProvider>
      </BrowserRouter>
    )
  }
}
