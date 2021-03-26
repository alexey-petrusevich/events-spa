import {Row, Col} from "react-bootstrap";
import {connect} from "react-redux";
import {Link} from "react-router-dom";


function ShowEvent({event}) {

    return (
        <div>{event}</div>
    );

    /*
    let rows = users.map((user) => (
        <tr key={user.id}>
            <td>{user.name}</td>
            <td>[Edit]</td>
        </tr>
    ));
    return (
        <div>
            <Row>
                <Col>
                <p>
                <
                    <h2>List Users</h2>
                    <p>
                        <Link to="/users/new">
                            New User
                        </Link>
                    </p>
                    <table className="table table-striped">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        {rows}
                        </tbody>
                    </table>
                </Col>
            </Row>
        </div>
    );
    */

}

function state2props({event}) {
    return {event};
}

export default connect(state2props)(ShowEvent);
