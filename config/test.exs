use Mix.Config

# Configures the Panel Endpoint
config :panel, Panel.Endpoint,
  http: [port: 4002],
  server: false

# Configures the Web Endpoint
config :web, Web.Endpoint,
  http: [port: 5002],
  server: false

# Configures the Core database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "project_core_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
