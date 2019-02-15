import * as React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import Header from './components/Header'
import HomePage from './pages'

const client = new ApolloClient({
  uri: 'http://localhost:4000/api/'
});

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <ApolloProvider client={client}>
        <Header />
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={HomePage} />
          </Switch>
        </BrowserRouter>
      </ApolloProvider>
    )
  }
}
