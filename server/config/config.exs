# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
use Mix.Config

config :events_app,
  ecto_repos: [EventsApp.Repo],
  mix_env: "#{Mix.env()}"

# Configures the endpoint
config :events_app, EventsAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YB2dCMoIQlSOlj5j9QI2bTERG6VNh2hpsrLBlkgKkz34EmsM6jdZIqBXVs5GqHdH",
  render_errors: [view: EventsAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EventsApp.PubSub,
  live_view: [signing_salt: "JoYBIk4j"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
