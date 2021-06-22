# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :hello_phx, HelloPhx.Repo,
  ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :hello_phx, HelloPhxWeb.Endpoint,
  http: [
    port: {:system, "PORT"}
  ],
  url: [scheme: "https", host: "ya-airdrop.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: secret_key_base

basic_auth_username =
  System.get_env("BASIC_AUTH_USERNAME") ||
    raise """
    environment variable BASIC_AUTH_USERNAME is missing.
    """
basic_auth_password =
  System.get_env("BASIC_AUTH_PASSWORD") ||
    raise """
    environment variable BASIC_AUTH_PASSWORD is missing.
    """
config :hello_phx, :basic_auth, username: basic_auth_username, password: basic_auth_password
