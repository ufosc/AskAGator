import * as React from 'react'
import { Query } from "react-apollo";
import gql from "graphql-tag";

import { connect } from 'react-redux'
import { IUser } from '../models/user';
import { loginAct } from '../store/actions/auth';

import ButtonAppBar from './ButtonAppBar';

interface HeaderProps {
  loginAct: Function
}

class Header extends React.Component<HeaderProps> {

  GET_PROFILE = gql`
    {
      profile {
        email
        name
      }
    }
  `;

  render() {
    return (
      <Query query={this.GET_PROFILE}>
        {({ loading, error, data }) => {
          if (!error && !loading) {
            this.props.loginAct({ email: data.profile.email, first_name: data.profile.name, last_name: data.profile.name, exists: true });
          }
          return <ButtonAppBar />
        }}
      </Query>
    )
  }
}

const mapDispatchToProps = (dispatch: any) => {
  return {
      loginAct: (user: IUser) => dispatch(loginAct(user)),
      dispatch
  }
}

export default connect(null, mapDispatchToProps)(Header);
