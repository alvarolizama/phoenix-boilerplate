use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.

# Configures the Panel Endpoint
config :panel, Panel.Endpoint,
  http: [port: 4002],
  server: false

# Configures the Core database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "project_core_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
