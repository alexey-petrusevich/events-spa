# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EventsApp.Repo,
      # Start the Telemetry supervisor
      EventsAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EventsApp.PubSub},
      # Start the Endpoint (http/https)
      EventsAppWeb.Endpoint
      # Start a worker by calling: EventsApp.Worker.start_link(arg)
      # {EventsApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EventsApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EventsAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
