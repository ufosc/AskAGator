import { useQuery } from "@apollo/react-hooks";
import { Typography } from "@material-ui/core";
import { gql } from "apollo-boost";
import React from "react";

const GET_PROFILE = gql`
{
  profile {
      name
      email
  }
}
`;

const ProfileData: React.FC = () => {
    const { loading, error, data } = useQuery(GET_PROFILE);

    if (loading) {
        return <p>Loading...</p>;
    }
    if (error){
        return <p>Error :(</p>;
    } 

    return (
        <>
        <Typography component="h1" variant="h5">
            name : {data.profile.name}
        </Typography>
        <Typography component="h1" variant="h5">
            email : {data.profile.email}
        </Typography>
        </>
    );
}

export default ProfileData;
