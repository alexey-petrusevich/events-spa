// BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
import './App.scss';
import {Container} from "react-bootstrap";
import {Switch, Route} from "react-router-dom";
import Nav from "./Nav";
import Feed from "./Feed";
import UsersList from "./Users/List";
import UsersNew from "./Users/New";
import EventNew from "./Events/New";
import ShowEvent from "./Events/Show"

function App() {
    return (
        <Container>
            <Nav/>
            <Switch>
                <Route path="/" exact>
                    <Feed/>
                </Route>
                <Route path="/users" exact>
                    <UsersList/>
                </Route>
                <Route path="/users/new" exact>
                    <UsersNew/>
                </Route>
                <Route path="/events/new" exact>
                    <EventNew/>
                </Route>
                <Route path="/events">
                    <ShowEvent/>
                </Route>
            </Switch>
        </Container>
    );
}

export default App;
