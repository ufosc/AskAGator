import React from 'react';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import { createStyles, withStyles, WithStyles, Theme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';

import { connect } from 'react-redux'

import { User } from '../models/user';

const styles = (theme: Theme) => createStyles({
  root: {
    flexGrow: 1,
  },
  grow: {
    flexGrow: 1,
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20,
  },
});

const HomeLink = (props: Props) => <Link to="/" {...props} />
const LoginLink = (props: Props) => <Link to="/login" {...props} />

export interface Props extends WithStyles<typeof styles> {
  user: User
}

const ButtonAppBar = withStyles(styles)(
  class extends React.Component<Props> {

    render() {
      const { classes, user } = this.props;

      let loginBtn;

      if (!user.exists) {
        loginBtn = <Button color="inherit" component={LoginLink} >Login</Button>
      } else {
        loginBtn = <Typography variant="h6" color="inherit" className={classes.grow}>{user.email}</Typography>
      }

      return (
        <AppBar position="static" style={{ margin: 0 }}>
          <Toolbar>
            <IconButton className={classes.menuButton} color="inherit" aria-label="Menu">
              <MenuIcon />
            </IconButton>
            <Typography variant="h6" color="inherit" className={classes.grow}>
              Ask a Gator
            </Typography>
            {loginBtn}
          </Toolbar>
        </AppBar>
      );
    }
  }
)

function matchStateToProps(state : any) {
  const { auth } = state;
  
  return {
    user: auth
  }
}


export default connect(matchStateToProps)(ButtonAppBar);
