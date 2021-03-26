import {Alert, Button, Col, Nav, Row} from "react-bootstrap";
import {NavLink} from "react-router-dom";
import {connect} from "react-redux";
import store from "./store";

function Link({to, children}) {
    return (
        <Nav.Item>
            <NavLink to={to} exact className="nav-link" activeClassName="active">
                {children}
            </NavLink>
        </Nav.Item>
    );
}

function AppNav({error}) {
    let error_row = null;

    if (error) {
        error_row = (
            <Row>
                <Col>
                    <Alert variant="danger">{error}</Alert>
                </Col>
            </Row>
        );
    }

    return (
        <div>
            <Row>
                <Col>
                    <Nav variant="pills">
                        <Link to="/">Feed</Link>
                        <Link to="/users">Users</Link>
                    </Nav>
                </Col>
                <Col>
                    <LoginOrInfo/>
                </Col>
            </Row>
            {error_row}
        </div>
    );
}

function SessionInfo({session}) {
    function logout(ev) {
        ev.preventDefault();
        store.dispatch({type: "session/clear"});
    }

    return (
        <p>
            Logged in as {session.name}
            <Button onClick={logout}>Logout</Button>
        </p>
    );
}

export default connect(({error}) => ({error}))(AppNav);