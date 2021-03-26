import {Row, Col, Card} from "react-bootstrap";
import {connect} from "react-redux";
import {Link} from "react-router-dom";


function Event({event}) {
    console.log("event in Feed.js")
    return (
        <Col>
            <Card>
                <Card.Text>
                    Created by {event.user.name}<br/>
                    {event.description}
                </Card.Text>
            </Card>
        </Col>
    );
}

function Feed({events, session}) {
    let cards = events.map((event) => (
        <Event event={event} key={event.id}/>
    ));

    let new_link = null;
    if (session) {
        new_link = (
            <p><Link to="/events/new">New Event</Link></p>
        );
    }

    return (
        <div>
            <h2>Feed</h2>
            {new_link}
            <Row>
                {cards}
            </Row>
        </div>
    );
}

export default connect(({events}) => ({events}))(Feed);
