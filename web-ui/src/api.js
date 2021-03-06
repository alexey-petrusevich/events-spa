// BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
import store from "./store"

//let baseUrl = "http://localhost:4000";
let baseUrl = "http://hw09.quickjohnny.art";

async function api_get(path) {
    console.log("in api_get");
    let text = await fetch(baseUrl + "/api/v1" + path, {});
    let resp = await text.json();
    return resp.data;
}

async function api_post(path, data) {
    console.log("in api_post")
    let opts = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
    };
    console.log("calling fetch");
    let text = await fetch(
        baseUrl + "/api/v1" + path, opts);
    console.log("waited for fetch to finish");
    return await text.json();
}

export function fetch_users() {
    console.log("in fetch_users");
    api_get("/users").then((data) => {
        let action = {
            type: "users/set",
            data: data
        };
        store.dispatch(action);
    });
}

export function fetch_events() {
    console.log("in fetch_events");
    api_get("/events").then((data) => {
        let action = {
            type: "events/set",
            data: data
        };
        store.dispatch(action);
    });
}


export function api_login(name, password, email) {
    api_post("/session", {name, password, email}).then((data) => {
        console.log("login resp", data);
        if (data.session) {
            console.log("session: " + data.session)
            let action = {
                type: "session/set",
                data: data.session
            };
            store.dispatch(action);
        } else if (data.error) {
            let action = {
                type: "error/set",
                data: data.error
            };
            store.dispatch(action);
        }
    })
}


export function create_user(user) {
    console.log("in create_user")
    return api_post("/users", {user});
}

export async function create_event(event) {
    let state = store.getState();
    let token = state?.session?.token;

    console.log("token");
    console.log(token);

    let data = new FormData();
    data.append("event[name]", event.name);
    data.append("event[date]", event.date);
    data.append("event[description]", event.description);
    data.append("event[link]", event.link);
    let opts = {
        method: 'POST',
        body: data,
        headers: {
            "x-auth": token
        }
    };
    let text = await fetch(baseUrl + "/api/v1/events", opts);
    return await text.json();
}


export function load_defaults() {
    fetch_users();
    fetch_events();
}
