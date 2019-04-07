import * as React from 'react'
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { WithStyles, createStyles, Theme, withStyles } from '@material-ui/core';
import CourseList from '../components/CourseList'
import gql from "graphql-tag";
import { Query } from 'react-apollo';

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
  courses: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  }
});

interface Props extends WithStyles<typeof styles> {
}

const ProfilePage = withStyles(styles)(
  class extends React.Component<Props> {
    HandleClick = () => {
      location.href = "/editprofile"
    };

    Profile = () => (
      <Query
      query={gql`
        {
          allUsers {
              name
              email
          }
        }
      `}
    >
      {({ loading, error, data }) => {
        if (loading) return <p>Loading...</p>;
        if (error) return <p>Error :(</p>;
  
        return (
          <div>
            <Typography component="h1" variant="h5">
              name : {name}
            </Typography>
            <Typography component="h1" variant="h5">
              email : {name}
            </Typography>
          </div>
        );
      }}
    </Query>
  )

    render() {
      const { classes } = this.props;
      return (
        <main className={classes.main}>
        <Typography component="h1" variant="h5">
        Profile
        </Typography>
        {this.Profile()}
        <Typography component="h1" variant="h5">
        Classes stub
        </Typography>
        <Button
          fullWidth
          variant="contained"
          color="primary"
          onClick={this.HandleClick}
        >
        Edit Profile
        </Button>
        </main>
      );
    }
  }
);

export default ProfilePage
