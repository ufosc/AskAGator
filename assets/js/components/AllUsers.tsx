import * as React from "react";
import { Query } from "react-apollo";
import gql from "graphql-tag";

const AllUsers = () => (
  <Query
    query={gql`
      {
        allUsers {
          id
          name
          email
        }
      }
    `}
  >
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;

      return data.allUsers.map(
        ({ id, name, email }: { id: string; name: string; email: string }) => (
          <div key={id}>
            <p>
              {name}: {email}
            </p>
          </div>
        )
      );
    }}
  </Query>
);

export default AllUsers;
