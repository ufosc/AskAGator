import * as React from "react";
import { BrowserRouter, Route, Switch, withRouter } from "react-router-dom";

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";

import { Provider } from "react-redux";
import { createStore } from "redux";

import { defaultStore } from "./store";
import reducers from "./store/reducers";

import EditProfilePage from './pages/EditProfilePage';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import SignUpPage from './pages/SignUpPage';
import JoinCoursePage from './pages/JoinCoursePage';

import CssBaseline from "@material-ui/core/CssBaseline";
import { ThemeProvider } from "@material-ui/styles";

import MainTheme from "./styles/MainTheme";

import Header from "./components/Header";
import ProfilePage from "./pages/ProfilePage";

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

const Root: React.FC = () => {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <ApolloProvider client={client}>
          <CssBaseline />
          <ThemeProvider theme={MainTheme}>
            <Header />
            <Switch>
              <Route exact={true} path="/" component={HomePage} />
              <Route path="/login" component={withRouter(LoginPage as any)} />
              <Route path="/signup" component={withRouter(SignUpPage as any)} />
              <Route path="/editprofile" component={withRouter(EditProfilePage as any)} />
              <Route path="/join" component={withRouter(JoinCoursePage as any)} />
              <Route path="/profile" component={withRouter(ProfilePage as any)} />
            </Switch>
          </ThemeProvider>
        </ApolloProvider>
      </BrowserRouter>
    </Provider>
  );
}

export default Root;
