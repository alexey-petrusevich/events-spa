# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsAppWeb.SessionController do
  use EventsAppWeb, :controller

  def create(conn, %{"name" => name, "password" => password, "email" => email}) do
    user = EventsApp.Users.authenticate(name, password, email)

    if user do
      sess = %{
        user_id: user.id,
        name: user.name,
        token: Phoenix.Token.sign(conn, "user_id", user.id)
      }
      conn
      |> put_resp_header(
           "content-type",
           "application/json; charset=UTF-8"
         )
      |> send_resp(:created, Jason.encode!(%{session: sess}))
    else
      conn
      |> put_resp_header(
           "content-type",
           "application/json; charset=UTF-8"
         )
      |> send_resp(:unauthorized, Jason.encode!(%{error: "fail"}))
    end
  end
end
