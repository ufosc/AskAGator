import React from 'react';
import PropTypes from 'prop-types';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import { Query } from "react-apollo";
import gql from "graphql-tag";

const AllCourses = () => (
  <Query
  query={gql`
    {
      AllCourses {
          id
          name
      }
    }
  `}
>
  {({ loading, error, data }) => {
    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    return data.allUsers.map(({id, name, email} : { id: string, name: string, email: string }) => (
      <div key={id}>
        <ListItemLink href={id}>
          <ListItemText primary={name} />
        </ListItemLink>
      </div>
    ));
  }}
</Query>
)

function ListItemLink(props) {
  return <ListItem button component="a" {...props} />;
}

function CourseList(props) {
  const { classes } = props;
  return (
    <div className={classes.root}>
      <List component="nav">
        {AllCourses}
      </List>
    </div>
  );
}

CourseList.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default CourseList;