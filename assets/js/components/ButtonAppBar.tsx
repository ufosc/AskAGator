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

import { useSelector } from "react-redux";
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

const HomeLink = (props: any) => <Link to="/" {...props} />;
const LoginLink = (props: any) => <Link to="/login" {...props} />;
const ProfileLink = (props: any) => <Link to="/profile" {...props} />;

const ButtonAppBar: React.FC = () => {
  const auth: IUser = useSelector((state: any) => ({ ...state.auth }));
  const classes = useStyles();

  let loginBtn;

  if (!auth.exists) {
    loginBtn = (
      <Button color="inherit" component={LoginLink as any}>
        Login
      </Button>
    );
  } else {
    loginBtn = (
      <Button color="inherit" style={{textTransform: "none"}} component={ProfileLink as any}>
        {auth.email}
      </Button>
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

export default ButtonAppBar;
