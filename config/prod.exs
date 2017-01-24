use Mix.Config

config :fitbit_leaderboard, FitbitLeaderboard.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "trineo-fitbit.herokuapp.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :fitbit_leaderboard, FitbitLeaderboard.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true