import {Row, Col, Card} from "react-bootstrap";
import {connect} from "react-redux";


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

function Feed({events}) {
    console.log("events")
    console.log(events.length)
    let cards = events.map((event) => (
        <Event event={event} key={event.id}/>
    ));
    return (
        <Row>
            {cards}
        </Row>
    );
}

export default connect(({events}) => ({events}))(Feed);
