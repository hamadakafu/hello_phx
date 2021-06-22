use Mix.Config

config :hello_phx, HelloPhxWeb.Endpoint,
  url: [host: "https://ya-airdrop.herokuapp.com/"],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

import_config "prod.secret.exs"
