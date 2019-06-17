import { Typography } from "@material-ui/core";
import { gql } from "apollo-boost";
import React from "react";
import { Query } from "react-apollo";

const GET_PROFILE = gql`
{
  profile {
      name
      email
  }
}
`;

const ProfileData: React.FC = () => {

    return (
        <Query
            query={GET_PROFILE}
        >
            {({ loading, error, data }: any) => {
                if (loading) return <p>Loading...</p>;
                if (error) return <p>Error :(</p>;

                return (
                    <div>
                        <Typography component="h1" variant="h5">
                            name : {data.profile.name}
                        </Typography>
                        <Typography component="h1" variant="h5">
                            email : {data.profile.email}
                        </Typography>
                    </div>
                );
            }}
        </Query>
    )
}

export default ProfileData;
