import * as React from 'react'
import { Mutation, Query } from "react-apollo";
import gql from "graphql-tag";
import { connect } from 'react-redux';
import { User } from '../models/user';
import { editNameAct, AUTH_ACTIONS } from '../store/actions/auth'

import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import FormControl from '@material-ui/core/FormControl';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { WithStyles, createStyles, Theme, withStyles } from '@material-ui/core';
import CenteredForm from '../styles/CenteredForm';
import { defaultDataIdFromObject } from 'apollo-boost';

const styles = (theme: Theme) => createStyles({
  main: {
    width: 'auto',
    display: 'block', // Fix IE 11 issue.
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: 'left',
    },
  },
  error:{
    color : "red"
  }
});

interface Props extends WithStyles<typeof CenteredForm> {
  editNameAct: Function,
  auth: User
}

const EDIT_NAME_MUTATION = gql`
    mutation edit_name($name: String!, $last_name: String!) {
      edit_name(first_name: $first_name, last_name: $last_name) {
          token
        }
    }
`;

const EditProfilePage = withStyles(styles)(
  class extends React.Component<Props> {

    state = {
      first_name: '',
      last_name: '',
      new_password: '',
      password_confirmation: '',
      current_password: '',
      password_mismatch: false
    }
    
    constructor(props : any)
    {
      super(props);
      const { classes, auth } = this.props;
      this.state.first_name = "" + auth.firstName;
      this.state.last_name = "" + auth.lastName;
    }
    
    handleChange = (name: string) => (event: any) => {
      this.setState({ [name]: event.target.value });
    };

    EditNameButton(props:any)
    {
      return(
        <Button
        fullWidth
        variant="contained"
        color="primary"
        className={props.classes.submit}
        onClick={ e => {
          e.preventDefault()
          props.edit_name({variables: {
            first_name: this.state.first_name, 
            last_name: this.state.first_name, 
          } }).then((result:any) => {
            this.props.editNameAct({firstName: this.state.first_name, LastName: this.state.last_name})
          })
        }
      }
      >
        Edit name
      </Button>
      );
    }
    
    EditPasswordButton(props:any)
    {
      return(
        <Button
          fullWidth
          variant="contained"
          color="primary"
          className={props.classes.submit}
          onClick={ e => {
            e.preventDefault()
            if (this.state.new_password === this.state.password_confirmation) {
              this.setState({password_mismatch: false});
              props.edit_password({variables: {
                password: this.state.new_password
              } }).then((result:any) => {
                //this.props.editPasswordAct({password: this.state.new_password})
              })
            }
            else {
              this.setState({password_mismatch: true});
            }
          }
          }
        >
          Edit password
        </Button>
      );
    }
    
    //if the new password does not match confirmation
    passwordMismatchMessage()
    {
      if (this.state.password_mismatch)
      {
        return (
          <Typography component="h1" variant="h6" className="error">
            Passwords must match
          </Typography>
        );
      }
    }

    render() {
      const { classes } = this.props;
      return (
        <Mutation mutation={EDIT_NAME_MUTATION}>
          {(edit_name, { data }) => (
            <main className={classes.main}>
              <Typography component="h1" variant="h5">
              Edit Profile
              </Typography>
              <Typography component="h1" variant="h6">
              Change Username
              </Typography>

              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="name">First name</InputLabel>
                <Input
                  name="name"
                  type="name"
                  id="name"
                  onChange={this.handleChange('first_name')}
                  value={this.state.first_name} />
              </FormControl>
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="password">Last name</InputLabel>
                <Input 
                  name="name" 
                  type="name" id="name"
                  onChange={this.handleChange('last_name')}
                  value={this.state.last_name}/>
              </FormControl>
              {this.EditNameButton({classes, edit_name})}

              <Typography component="h1" variant="h6">
              Change Password
              </Typography>
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="password">Enter current password</InputLabel>
                <Input 
                name="password"
                type="password"
                id="password"
                autoComplete="current-password"
                onChange={this.handleChange('current_password')}
                value={this.state.current_password}/>
              </FormControl>
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="password">Enter new password</InputLabel>
                <Input
                  error={this.state.password_mismatch}
                  name="password"
                  type="password"
                  id="password"
                  onChange={this.handleChange('new_password')}
                  value={this.state.new_password} />
              </FormControl>
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="password">Confirm new password</InputLabel>
                <Input
                  error={this.state.password_mismatch}
                  name="password"
                  type="password"
                  id="password"
                  onChange={this.handleChange('password_confirmation')}
                  value={this.state.password_confirmation} />
              </FormControl>
              {this.passwordMismatchMessage()}
              {this.EditPasswordButton({classes, /*edit_password*/})}
            </main>
          )}  
        </Mutation>
      );
    }
  }
);

const matchStateToProps = (state : any, ownprops:any) => {
  const { auth } = state.auth;
  //auth.firstName = ownprops.firstName;
  //auth.lastName = ownprops.lastName;
  return {
    auth
  }
}

const mapDispatchToProps = (dispatch: any) => {
  return {
    editNameAct: (user: User) => dispatch(editNameAct(user.firstName, user.lastName)),
    dispatch
  }
}

//export default EditProfilePage;
export default connect(matchStateToProps, mapDispatchToProps)(EditProfilePage);