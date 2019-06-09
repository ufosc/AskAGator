import React, { Component } from 'react'
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';

class CourseListItem extends React.Component {
  props:any;

  render() {
    return (
      <ListItem button onClick={e => {location.href = "/".concat(this.props.code)}}>
        <ListItemText>
          {this.props.name}
        </ListItemText>
      </ListItem>
    )
  }
}

export default CourseListItem