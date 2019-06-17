import * as React from "react";

import gql from "graphql-tag";
import { Query } from "react-apollo";


import { useDispatch } from "react-redux";
import { IUser } from "../models/user";
import { loginAct } from "../store/actions/auth";

import ButtonAppBar from "./ButtonAppBar";

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

const Header: React.FC = () => {
  const dispatch = useDispatch();

  return (
    <Query<IGetProfile> query={GET_PROFILE}>
      {({ loading, error, data }) => {
        if (!error && !loading && data) {
          dispatch(loginAct({
            email: data.profile.email,
            exists: true,
            firstName: data.profile.name,
            lastName: data.profile.name,
          }));
        }
        return <ButtonAppBar />;
      }}
    </Query>
  );
};

export default Header;
