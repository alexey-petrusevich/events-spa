// BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
import {Row, Col, Card} from "react-bootstrap";
import {connect} from "react-redux";
import {Link} from "react-router-dom";


function Event({event, session}) {
    console.log("event in Feed.js")
    let select = null;
    if (session) {
        let toLink = `/events/${event.id}`
        select = (
            <Link to={toLink}>Select</Link>
        );
    }
    return (
        <Col>
            <Card>
                <Card.Text>
                    Created by: {event.user.name}<br/>
                    Date: {event.date} <br />
                    Description: {event.description}<br/>
                    Link: {event.link}<br/>
                    {select}
                </Card.Text>
            </Card>
        </Col>
    );
}

function Feed({events, session}) {
    let cards = events.map((event) => (
        <Event event={event} session={session} key={event.id}/>
    ));

    let new_link = null;
    if (session) {
        console.log("session is not null")
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

export default connect(({events, session}) => ({events, session}))(Feed);
