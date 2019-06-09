import * as React from "react";
import { BrowserRouter, Route, Switch, withRouter } from "react-router-dom";

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import { Provider } from "react-redux";
import { createStore } from "redux";

import { defaultStore } from "./store";
import reducers from "./store/reducers";

import HomePage from "./pages/HomePage";
import LoginPage from "./pages/LoginPage";
import SignUpPage from "./pages/SignUpPage";

import Header from "./components/Header";

const client = new ApolloClient({
  fetchOptions: {
    credentials: "include",
  },
  onError: ({ graphQLErrors, networkError }) => {
    // Do something with the errors lol
  },
  uri: "http://localhost:4000/api",
});

const store = createStore(reducers, defaultStore as any);

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <Provider store={store}>
        <BrowserRouter>
          <ApolloProvider client={client}>
            <Header />
            <Switch>
              <Route exact={true} path="/" component={HomePage} />
              <Route path="/login" component={withRouter(LoginPage as any)} />
              <Route path="/signup" component={withRouter(SignUpPage as any)} />
            </Switch>
          </ApolloProvider>
        </BrowserRouter>
      </Provider>
    );
  }
}
