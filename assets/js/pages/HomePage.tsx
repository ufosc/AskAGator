import * as React from 'react'

import AllUsers from '../components/AllUsers'
import Main from '../components/Main'

class HomePage extends React.Component {
    public render() {
        return (
            <Main>
                Hello These are all the users retrieved using a GraphQL Query!!!!!
                <AllUsers/>
            </Main>
        );
    }
};

export default HomePage;
