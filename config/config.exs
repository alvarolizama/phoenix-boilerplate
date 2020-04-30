import Config

# Configure Mix tasks and generators
config :core,
  ecto_repos: [Core.Repo]

config :panel,
  ecto_repos: [Core.Repo],
  generators: [context_app: :core]

# Configures the Panel Endpoint
config :panel, Panel.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oA1+ElFm8zJaBJrlUaBol8WR+HrXzWZo8ky6QJo5AdCugBFNjNEJ0e+wu5YuGL5u",
  render_errors: [view: Panel.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Panel.PubSub,
  live_view: [signing_salt: "CQeF2gS2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures passwords for user accounts
config :comeonin, Ecto.Password, Pbkdf2
config :comeonin, :pbkdf2_rounds, 120_000
config :comeonin, :pbkdf2_salt_len, 512

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
