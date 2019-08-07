import * as React from 'react'

import { Paper } from '@material-ui/core';
import Typography from '@material-ui/core/Typography';

import { useSelector } from 'react-redux';
import { Redirect } from 'react-router';

import { IUser } from '../models/user';
import CenteredForm from '../styles/CenteredForm';


const ProfilePage: React.FC = () => {
  const classes = CenteredForm();
  const auth: IUser = useSelector((state: any) => ({ ...state.auth }));

  if (!auth.exists && !auth.loading) {
    return <Redirect to="/login" />;
  }

  return (
    <main className={classes.main}>
      <Paper className={classes.paper}>
        <Typography component="h1" variant="h4">
          Profile
        </Typography>
        {auth.loading ? (<>Loading...</>) : (
          <div>
            <div>
              Name:{` ${auth.firstName} ${auth.lastName}`}
            </div>
            <div>
              Email: {` ${auth.email}`}
            </div>
          </div>
        )}
      </Paper>
    </main>
  );
}

export default ProfilePage;
