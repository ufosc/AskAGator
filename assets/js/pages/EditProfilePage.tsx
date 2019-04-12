import * as React from 'react'
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import FormControl from '@material-ui/core/FormControl';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { WithStyles, createStyles, Theme, withStyles } from '@material-ui/core';

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
  }
});

interface Props extends WithStyles<typeof styles> {
}

const EditProfilePage = withStyles(styles)(
  class extends React.Component<Props> {

    render() {
      const { classes } = this.props;
      return (
          <main className={classes.main}>
            <Typography component="h1" variant="h5">
            Edit Profile
            </Typography>
            <Typography component="h1" variant="h6">
            Change Username
            </Typography>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">First name</InputLabel>
              <Input name="password" type="password" id="password" autoComplete="current-password" />
            </FormControl>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Last name</InputLabel>
              <Input name="password" type="password" id="password" autoComplete="current-password" />
            </FormControl>
            <Button
              fullWidth
              variant="contained"
              color="primary"
              //className={classes.submit}
              //onClick={this.editProfile}
            >
            Change Username
            </Button>

            <Typography component="h1" variant="h6">
            Change Password
            </Typography>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Enter current password</InputLabel>
              <Input name="password" type="password" id="password" autoComplete="current-password" />
            </FormControl>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Enter new password</InputLabel>
              <Input name="password" type="password" id="password" autoComplete="current-password" />
            </FormControl>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Confirm new password</InputLabel>
              <Input name="password" type="password" id="password" autoComplete="current-password" />
            </FormControl>
            <Button
              fullWidth
              variant="contained"
              color="primary"
              //onClick={this.editProfile}
            >
            Change Password
            </Button>
          </main>
        );

      }
    }
);

export default EditProfilePage
