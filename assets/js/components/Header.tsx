import * as React from "react";

import gql from "graphql-tag";
import { Query } from "react-apollo";


import { connect } from "react-redux";
import { IUser } from "../models/user";
import { loginAct } from "../store/actions/auth";

import ButtonAppBar from "./ButtonAppBar";

interface IHeaderProps {
  loginAct: (user: IUser) => any;
}

interface IGetProfile {
  profile: {
    email: string,
    name: string,
  }
}

const GET_PROFILE = gql`
  {
    profile {
      email
      name
    }
  }
`;

const Header: React.FC<IHeaderProps> = (props: IHeaderProps) => {
  return (
    <Query<IGetProfile> query={GET_PROFILE}>
      {({ loading, error, data }) => {
        if (!error && !loading && data) {
          props.loginAct({
            email: data.profile.email,
            exists: true,
            firstName: data.profile.name,
            lastName: data.profile.name,
          });
        }
        return <ButtonAppBar />;
      }}
    </Query>
  );
};

const mapDispatchToProps = (dispatch: any) => {
  return {
    dispatch,
    loginAct: (user: IUser) => dispatch(loginAct(user)),
  };
};

export default connect(
  null,
  mapDispatchToProps
)(Header);
