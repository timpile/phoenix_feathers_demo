# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_feathers_demo,
  ecto_repos: [PhoenixFeathersDemo.Repo]

# Configures the endpoint
config :phoenix_feathers_demo, PhoenixFeathersDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nDOKOAveOTMmrfhDFh2Jtq972aiZAf+jlsCF9M8lggEsQprixvF6DTIxOZuyY0vL",
  render_errors: [view: PhoenixFeathersDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixFeathersDemo.PubSub,
  live_view: [signing_salt: "NkAxz/F/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
