import './App.css';
import {useState, useEffect} from 'react';

async function fetchUsers() {
    // send GET request to /users and wait for response
    let text = await fetch("http://localhost:400/api/v1/users", {});
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
        <div>
            <ul>
                {users.map((uu) => (<li key={uu.id}>{uu.name}</li>))}
            </ul>
        </div>
    );
}

export default App;
