import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'
import Main from '../components/Main'
import AllUsers from '../components/AllUsers'

class HomePage extends React.Component {
    render() {
        return (
            <Main>
                Hello These are all the users retrieved using a GraphQL Query!!!!!
                <AllUsers></AllUsers>
            </Main>
        );
    }
};

export default HomePage
