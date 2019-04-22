import React from 'react';
import List from '@material-ui/core/List';
import { Query } from "react-apollo";
import gql from "graphql-tag";
import CourseListItem from "./CourseListItem";
import PropTypes from 'prop-types';

class CourseList extends React.Component {

  GET_USER_COURSES = gql`
  {
    user_courses {
      name
      code
    }
  }
  `;
  
  UserCourses = () => (
    <Query query={this.GET_USER_COURSES}>
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;
        return data.userCourses.map(({code, name} : { code: string, name: string}) => (
          <div key={code}>
            <CourseListItem code = {code} name = {name}/>
        </div>
      ));
    }}
  </Query>
  )
  
  CourseList(props:any) {
    const { classes } = props;
    return (
      <List component="nav">
        {this.UserCourses}
      </List>
    );
  }
}

export default CourseList;