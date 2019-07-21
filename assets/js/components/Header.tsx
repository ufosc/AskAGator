import * as React from "react";

import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";


import { useDispatch } from "react-redux";
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
  const { loading, error, data } = useQuery<IGetProfile>(GET_PROFILE);
  
  if (!error && !loading && data && data.profile) {
    dispatch(loginAct({
      email: data.profile.email,
      exists: true,
      firstName: data.profile.name,
      lastName: data.profile.name,
      loading: false,
    }));
  }
  if (error && !loading) {
    dispatch(loginAct({
      exists: false,
      loading: false,
    }));
  }
  
  if (loading) {
    dispatch(loginAct({
      exists: false,
      loading: true,
    }));
  }

  return (
    <ButtonAppBar />
  );
};

export default Header;
