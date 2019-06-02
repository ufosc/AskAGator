import * as React from 'react'

import { Mutation } from "react-apollo";
import gql from "graphql-tag";

import { connect } from 'react-redux';

import { User } from '../models/user';
import { loginAct, AUTH_ACTIONS } from '../store/actions/auth'

import {Redirect} from 'react-router';

import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import FormControl from '@material-ui/core/FormControl';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import { WithStyles, createStyles, Theme, withStyles } from '@material-ui/core';

import CenteredForm from '../styles/CenteredForm';

interface Props extends WithStyles<typeof CenteredForm> {
    loginAct: Function,
    auth: User
}

const LOGIN_MUTATION = gql`
    mutation login($email: String!, $password: String!) {
        login(email: $email, password: $password) {
            token
        }
    }
`;

const LoginPage = withStyles(CenteredForm)(
    class extends React.Component<Props> {
        state = {
            email: '',
            password: ''
        };

        handleChange = (name: string) => (event: any) => {
            this.setState({ [name]: event.target.value });
        };

        render() {
            const { classes, auth } = this.props;
            if (auth.exists) {
                return <Redirect to='/' />
            }
            return (
                <Mutation mutation={LOGIN_MUTATION}>
                    {(login, { data, loading, error }) => (
                        <main className={classes.main}>
                            <CssBaseline />
                            <Paper className={classes.paper}>
                                <Avatar className={classes.avatar}>
                                    <LockOutlinedIcon />
                                </Avatar>
                                <Typography component="h1" variant="h5">
                                    Sign in
                                </Typography>
                                {error && <p>Wrong username or password</p>}
                                <form className={classes.form}>
                                    <FormControl margin="normal" required fullWidth>
                                        <InputLabel htmlFor="email">Email Address</InputLabel>
                                        <Input id="email" name="email" autoComplete="email" autoFocus value={this.state.email} onChange={this.handleChange('email')} />
                                    </FormControl>
                                    <FormControl margin="normal" required fullWidth>
                                        <InputLabel htmlFor="password">Password</InputLabel>
                                        <Input name="password" type="password" id="password" autoComplete="current-password" value={this.state.password} onChange={this.handleChange('password')} />
                                    </FormControl>
                                    <FormControlLabel
                                        control={<Checkbox value="remember" color="primary" />}
                                        label="Remember me"
                                    />
                                    <Button
                                        fullWidth
                                        variant="contained"
                                        color="primary"
                                        className={classes.submit}
                                        onClick={e => {
                                            e.preventDefault()
                                            login({ variables: { email: this.state.email, password: this.state.password } }).then((result) => {
                                                this.props.loginAct({ email: this.state.email, firstName: '', lastName: '', exists: true })
                                            })
                                        }
                                        }>
                                        Sign in
                                    </Button>
                                </form>
                            </Paper>
                        </main>
                    )}
                </Mutation>
            );
        }
    }
);

const matchStateToProps = (state : any) => {
    const { auth } = state;
    return {
        auth
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        loginAct: (user: User) => dispatch(loginAct(user)),
        dispatch
    }
}

export default connect(matchStateToProps, mapDispatchToProps)(LoginPage);
