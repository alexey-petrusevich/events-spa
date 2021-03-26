import {Row, Col, Form, Button} from "react-bootstrap";
import {useState} from "react";
import {create_event} from "../api";

export default function EventsNew() {
    let [event, setEvent] = useState({});

    function onSubmit(ev) {
        ev.preventDefault();
        console.log(ev);
        console.log(event);
        create_event(event)
    }

    function updateDescription(ev) {
        let p1 = Object.assign({}, event);
        p1["description"] = ev.target.value;
        setEvent(p1);
    }

    function updateName(ev) {
        let p1 = Object.assign({}, event);
        p1["name"] = ev.target.value;
        setEvent(p1);
    }

    function updateDateTime(ev) {
        let p1 = Object.assign({}, event);
        p1["date"] = ev.target.value;
        setEvent(p1);
    }

    function updateLink(ev) {
        let p1 = Object.assign({}, event);
        p1["link"] = ev.target.value;
        setEvent(p1);
    }

    return (
      <Row>
          <Col>
              <h2>New Event</h2>
              <Form onSubmit={onSubmit}>
                  <Form.Group>
                      <Form.Label>Name</Form.Label>
                      <Form.Control type="text"
                                    onChange={updateName}
                                    value={event.description} />
                  </Form.Group>
                  <Form.Group>
                      <Form.Label>Date & Time</Form.Label>
                      <Form.Control type="date"
                                    onChange={updateDateTime}
                                    value={event.date} />
                  </Form.Group>
                  <Form.Group>
                      <Form.Label>Description</Form.Label>
                      <Form.Control as="textarea"
                                    rows={4}
                                    onChange={updateDescription}
                                    value={event.description} />
                  </Form.Group>
                  <Form.Group>
                      <Form.Label>Link</Form.Label>
                      <Form.Control type="text"
                                    onChange={updateLink}
                                    value={event.link} />
                  </Form.Group>
                  <Button variant="primary" type="submit">
                      Save
                  </Button>
              </Form>
          </Col>
      </Row>
    );
}