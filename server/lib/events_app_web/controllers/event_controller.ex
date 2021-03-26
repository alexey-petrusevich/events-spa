# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsAppWeb.EventController do
  use EventsAppWeb, :controller

  alias EventsApp.Events
  alias EventsApp.Events.Event

  alias EventsAppWeb.Plugs
  plug Plugs.RequireAuth when action
                              in [:create]

  action_fallback EventsAppWeb.FallbackController

  def index(conn, _params) do
    IO.inspect("in index")
    events = Events.list_events()
    render(conn, "index.json", events: events)
  end

  def create(conn, %{"event" => event_params}) do

    IO.inspect("in create event_controller")

    user = conn.assigns[:current_user]

    IO.inspect("retrieved user from conn")
    IO.inspect(user)

    event_params = event_params
                   |> Map.put("user_id", user.id)

    IO.inspect({:event, event_params})

    with {:ok, %Event{} = event} <- Events.create_event(event_params) do
      IO.inspect("modifying connection")
      conn = conn
      |> put_status(:created)
      IO.inspect("added created status")
      conn = conn
      |> put_resp_header("location", Routes.event_path(conn, :show, event))
      IO.inspect("added resp header")
      IO.inspect("rendering event")
      IO.inspect(event)
      conn
      |> render("show.json", event: event)
    end
  end


  def show(conn, %{"id" => id}) do
    IO.inspect("in show")
    event = Events.get_event!(id)
    render(conn, "show.json", event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Events.get_event!(id)

    with {:ok, %Event{} = event} <- Events.update_event(event, event_params) do
      render(conn, "show.json", event: event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Events.get_event!(id)

    with {:ok, %Event{}} <- Events.delete_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
