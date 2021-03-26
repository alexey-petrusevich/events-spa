# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsApp.Repo do
  use Ecto.Repo,
    otp_app: :events_app,
    adapter: Ecto.Adapters.Postgres
end
