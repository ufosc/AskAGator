import {
  AppBar,
  Button,
  IconButton,
  Toolbar,
  Typography,
} from "@material-ui/core";
import MenuIcon from "@material-ui/icons/Menu";
import { makeStyles } from "@material-ui/styles";

import React from "react";
import { Link } from "react-router-dom";

import { connect } from "react-redux";

import { IUser } from "../models/user";

const useStyles = makeStyles({
  grow: {
    flexGrow: 1,
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20,
  },
  root: {
    flexGrow: 1,
  },
});

const HomeLink = (props: IButtonAppBarProps) => <Link to="/" {...props} />;
const LoginLink = (props: IButtonAppBarProps) => <Link to="/login" {...props} />;

export interface IButtonAppBarProps {
  user: IUser;
}

const ButtonAppBar: React.FC<IButtonAppBarProps> = (props: IButtonAppBarProps) => {
  const { user } = props;
  const classes = useStyles();

  let loginBtn;

  if (!user.exists) {
    loginBtn = (
      <Button color="inherit" component={LoginLink as any}>
        Login
      </Button>
    );
  } else {
    loginBtn = (
      <Typography variant="h6" color="inherit" className={classes.grow}>
        {user.email}
      </Typography>
    );
  }

  return (
    <AppBar position="static" color="primary">
      <Toolbar>
        <IconButton
          className={classes.menuButton}
          color="inherit"
          aria-label="Menu"
        >
          <MenuIcon />
        </IconButton>
        <Typography variant="h6" color="inherit" className={classes.grow}>
          Ask a Gator
        </Typography>
        {loginBtn}
      </Toolbar>
    </AppBar>
  );
};

function matchStateToProps(state: any) {
  const { auth } = state;

  return {
    user: auth,
  };
}

export default connect(matchStateToProps)(ButtonAppBar);
