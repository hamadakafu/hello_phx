# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_phx,
  ecto_repos: [HelloPhx.Repo]

# Configures the endpoint
config :hello_phx, HelloPhxWeb.Endpoint,
  url: [host: "0.0.0.0"],
  secret_key_base: "lOHcTIniaX6qYxpYisB+a0CbMcVZggncjQFlGlreLLVnk28P1FVQh4qLMNfokPC2",
  render_errors: [view: HelloPhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloPhx.PubSub,
  live_view: [signing_salt: "IO3kQsEF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
