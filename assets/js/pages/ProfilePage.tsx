import * as React from 'react'

import { Link, Theme } from '@material-ui/core';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/styles';

import ProfileData from '../components/ProfileData';

const useStyles = makeStyles((theme: Theme) => ({
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
  courses: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  }
}));

const EditProfileLink = (props: any) => <Link to="/login" {...props} />;

const ProfilePage: React.FC = () => {
  const classes = useStyles();

  return (
    <main className={classes.main}>
      <Typography component="h1" variant="h5">
        Profile
        </Typography>
      <ProfileData />
      <Typography component="h1" variant="h5">
        Classes stub
        </Typography>
      {/* <CourseList/> */}
      <Button
        component={EditProfileLink as any}
      >
        Edit Profile
        </Button>
    </main>
  );
}

export default ProfilePage;
