import * as React from 'react'
import { BrowserRouter, Route, Switch, withRouter } from 'react-router-dom'
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import { AUTH_TOKEN } from './constants';

import HomePage from './pages/index';
import LoginPage from './pages/LoginPage';
import SignUpPage from './pages/SignUpPage';
import AddCoursePage from './pages/AddCoursePage';
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

            <Route path="/signup" component={withRouter(SignUpPage)} />
            <Route path="/addcourse" component={withRouter(AddCoursePage)} />
          </Switch>
        </ApolloProvider>
      </BrowserRouter>
    )
  }
}
