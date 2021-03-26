import {createStore, combineReducers} from "redux";

function users(state = [], action) {
    switch (action.type) {
        case "users/set":
            return action.data;
        default:
            return state;
    }
}

function user_form(state = {}, action) {
    switch (action.type) {
        case "user_form/set":
            return action.data;
        default:
            return state;
    }
}

function events(state = [], action) {
    console.log("events reducer")
    switch (action.type) {
        case "events/set":
            console.log("action data")
            console.log(action.data)
            return action.data;
        default:
            console.log("Default")
            return state;
    }
}

function root_reducer(state, action) {
    console.log("root_reducer", state, action);
    let reducer = combineReducers({
        users, user_form, events
    });
    return reducer(state, action);
}

let store = createStore(root_reducer);
export default store;
