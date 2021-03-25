import './App.scss';
import {useState, useEffect} from 'react';
import Users from "./Users";
import {Container} from "react-bootstrap";

async function fetchUsers() {
    // send GET request to /users and wait for response
    let text = await fetch("http://localhost:4000/api/v1/users", {});
    // convert to json
    let resp = await text.json();
    // return only data component
    return resp.data;
}

function App() {
    const [users, setUsers] = useState([]);

    useEffect(() => {
        if (users.length === 0) {
            fetchUsers().then((xs) => setUsers(xs));
        }
    }, [users]);

    return (
        <Container>
            <Users users={users}/>
        </Container>
    );
}

export default App;
