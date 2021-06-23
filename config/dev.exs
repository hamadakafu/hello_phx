use Mix.Config

# Configure your database
config :hello_phx, HelloPhx.Repo,
  url: "postgres://postgres:postgres@127.0.0.1:5432/hello_phx_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :hello_phx, HelloPhxWeb.Endpoint,
  http: [port: 4000],
  debug_errors: false,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Watch static and templates for browser reloading.
config :hello_phx, HelloPhxWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/hello_phx_web/(live|views)/.*(ex)$",
      ~r"lib/hello_phx_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :hello_phx, :basic_auth, username: "hello", password: "secret"

config :hello_phx, HelloPhx.HttpCrawl, url: "http://localhost:4000"
