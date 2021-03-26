# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsAppWeb.UpdateController do
  use EventsAppWeb, :controller

  alias EventsApp.Updates
  alias EventsApp.Updates.Update

  action_fallback EventsAppWeb.FallbackController

  def index(conn, _params) do
    updates = Updates.list_updates()
    render(conn, "index.json", updates: updates)
  end

  def create(conn, %{"update" => update_params}) do
    with {:ok, %Update{} = update} <- Updates.create_update(update_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.update_path(conn, :show, update))
      |> render("show.json", update: update)
    end
  end

  def show(conn, %{"id" => id}) do
    update = Updates.get_update!(id)
    render(conn, "show.json", update: update)
  end

  def update(conn, %{"id" => id, "update" => update_params}) do
    update = Updates.get_update!(id)

    with {:ok, %Update{} = update} <- Updates.update_update(update, update_params) do
      render(conn, "show.json", update: update)
    end
  end

  def delete(conn, %{"id" => id}) do
    update = Updates.get_update!(id)

    with {:ok, %Update{}} <- Updates.delete_update(update) do
      send_resp(conn, :no_content, "")
    end
  end
end
