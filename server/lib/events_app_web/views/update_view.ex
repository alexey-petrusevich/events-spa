defmodule EventsAppWeb.UpdateView do
  use EventsAppWeb, :view
  alias EventsAppWeb.UpdateView

  def render("index.json", %{updates: updates}) do
    %{data: render_many(updates, UpdateView, "update.json")}
  end

  def render("show.json", %{update: update}) do
    %{data: render_one(update, UpdateView, "update.json")}
  end

  def render("update.json", %{update: update}) do
    %{id: update.id,
      update: update.update}
  end
end
