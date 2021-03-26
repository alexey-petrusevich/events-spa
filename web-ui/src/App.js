import './App.scss';
import {Container} from "react-bootstrap";
import {Switch, Route} from "react-router-dom";
import Nav from "./Nav";
import Feed from "./Feed";
import UsersList from "./Users/List";
import UsersNew from "./Users/New";
import EventNew from "./Events/New";

function App() {
    return (
        <Container>
            <Nav/>
            <Switch>
                <Route path="/" exact>
                    <Feed/>
                </Route>
                <Route path="/users">
                    <UsersList/>
                </Route>
                <Route path="/users/new">
                    <UsersNew/>
                </Route>
                <Route path="/events/new">
                    <EventNew/>
                </Route>
            </Switch>
        </Container>
    );
}

export default App;
