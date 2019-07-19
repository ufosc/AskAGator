import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import FormControl from '@material-ui/core/FormControl';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import NoteAdd from '@material-ui/icons/NoteAddOutlined';

import * as React from 'react';
import { useSelector } from 'react-redux';
import { Redirect } from 'react-router';

import { useMutation } from '@apollo/react-hooks';
import gql from 'graphql-tag';

import CenteredForm from "../styles/CenteredForm";

const JOIN_COURSE_MUTATION = gql`
    mutation joinCourse($joinCode: String!) {
        joinCourse(joinCode: $joinCode)
    }
`;

const JoinCoursePage: React.FC = () => {
    const [joinCode, setJoinCode] = React.useState("");
    const auth = useSelector((state: any) => ({ ...state.auth }));
    const classes = CenteredForm();
    const [joinCourse, { error, data }] = useMutation(JOIN_COURSE_MUTATION, {
        variables: { joinCode }
    });

    if (!auth.exists) {
        return <Redirect to="/login" />;
    }

    const handleChange = (stateAction: React.Dispatch<React.SetStateAction<any>>) => (e: any) => {
        stateAction(e.target.value);
    }

    const handleJoin = () => (event: React.MouseEvent) => {
        event.preventDefault();
        joinCourse();
    }

    if (data && data.joinCourse) {
        return <Redirect to="/" />;
    }

    return (
        <main className={classes.main}>
            <CssBaseline />
            <Paper className={classes.paper}>
                <Avatar className={classes.avatar}>
                    <NoteAdd />
                </Avatar>
                <Typography component="h1" variant="h5">
                    Join a Course
                        </Typography>
                {error ? (
                    <div>Error Invalid JoinCode</div>
                ): null}
                <form className={classes.form}>
                    <FormControl margin="normal" required={true} fullWidth={true}>
                        <InputLabel htmlFor="joincode">Join Code</InputLabel>
                        <Input id="joincode" name="joincode" autoFocus={true} onChange={handleChange(setJoinCode)}/>
                    </FormControl>
                    <Button
                        fullWidth={true}
                        variant="contained"
                        color="primary"
                        className={classes.submit}
                        onClick={handleJoin()}
                    >
                        Add course
                        </Button>
                </form>
            </Paper>
        </main>
    )
}

export default JoinCoursePage;
