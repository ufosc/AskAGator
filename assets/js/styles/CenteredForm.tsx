import { Theme } from "@material-ui/core";
import { makeStyles } from "@material-ui/styles";

const styles = makeStyles((theme: Theme) => ({
  avatar: {
    backgroundColor: theme.palette.secondary.main,
    margin: theme.spacing.unit,
  },
  form: {
    marginTop: theme.spacing.unit,
    width: "100%", // Fix IE 11 issue.
  },
  main: {
    display: "block", // Fix IE 11 issue.
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    width: "auto",
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      marginLeft: "auto",
      marginRight: "auto",
      width: 400,
    },
  },
  paper: {
    alignItems: "center",
    display: "flex",
    flexDirection: "column",
    marginTop: theme.spacing.unit * 8,
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme
      .spacing.unit * 3}px`,
  },
  submit: {
    marginTop: theme.spacing.unit * 3,
  },
}));

export default styles;
