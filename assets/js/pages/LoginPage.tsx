import * as React from "react";
import { useState } from "react";

import { Mutation } from "react-apollo";

import gql from "graphql-tag";

import { useDispatch, useSelector } from 'react-redux';


import { IUser } from "../models/user";
import { loginAct } from "../store/actions/auth";

import { Redirect } from "react-router";

import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import Checkbox from "@material-ui/core/Checkbox";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Input from "@material-ui/core/Input";
import InputLabel from "@material-ui/core/InputLabel";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import LockOutlinedIcon from "@material-ui/icons/LockOutlined";

import CenteredForm from "../styles/CenteredForm";
import { useMutation } from "@apollo/react-hooks";

const LOGIN_MUTATION = gql`
  mutation login($email: String!, $password: String!) {
    login(email: $email, password: $password) {
      token
    }
  }
`;

const LoginPage: React.FC = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const auth = useSelector((state: any) => ({ ...state.auth }));
  const dispatch = useDispatch();
  const classes = CenteredForm();
  const [loginMutation, { error, data }] = useMutation(LOGIN_MUTATION, {
    variables: {
      email,
      password,
    },
  });

  if (auth.exists) {
    return <Redirect to="/" />;
  }

  const handleChange = (stateAction: React.Dispatch<React.SetStateAction<any>>) => (e: any) => {
    stateAction(e.target.value);
  }

  const handleLogin = () => (event: React.MouseEvent) => {
    event.preventDefault();
    loginMutation().then(() => {
      dispatch(loginAct({
        email,
        exists: true,
        firstName: "",
        lastName: "",
      }));
    });
  }

  return (
    <main className={classes.main}>
      <Paper className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Sign in
                </Typography>
        {error && <p>Wrong username or password</p>}
        <form className={classes.form}>
          <FormControl margin="normal" required={true} fullWidth={true}>
            <InputLabel htmlFor="email">Email Address</InputLabel>
            <Input
              id="email"
              name="email"
              autoComplete="email"
              autoFocus={true}
              value={email}
              onChange={handleChange(setEmail)}
            />
          </FormControl>
          <FormControl margin="normal" required={true} fullWidth={true}>
            <InputLabel htmlFor="password">Password</InputLabel>
            <Input
              name="password"
              type="password"
              id="password"
              autoComplete="current-password"
              value={password}
              onChange={handleChange(setPassword)}
            />
          </FormControl>
          <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="Remember me"
          />
          <Button
            fullWidth={true}
            variant="contained"
            color="primary"
            type="submit"
            className={classes.submit}
            onClick={handleLogin()}
          >
            Sign in
                  </Button>
        </form>
      </Paper>
    </main>
  );
}

export default LoginPage;
