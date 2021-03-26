defmodule EventsAppWeb.EventView do
  use EventsAppWeb, :view
  alias EventsAppWeb.EventView
  alias EventsAppWeb.UserView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      id: event.id,
      name: event.name,
      date: event.date,
      description: event.description,
      link: event.link,
      user: render_one(event.user, UserView, "user.json"),
    }
  end
end
