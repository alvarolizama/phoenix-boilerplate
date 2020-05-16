use Mix.Config

# Configures the Panel Endpoint
config :panel, Panel.Endpoint,
  http: [port: 4000],
  https: [
    port: 4001,
    cipher_suite: :strong,
    keyfile: "priv/cert/selfsigned_key.pem",
    certfile: "priv/cert/selfsigned.pem"
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/panel/assets", __DIR__)
    ]
  ]

config :panel, Panel.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/panel/(live|views)/.*(ex)$",
      ~r"lib/panel/templates/.*(eex)$"
    ]
  ]

# Configures the Web Endpoint
config :web, Web.Endpoint,
  http: [port: 5000],
  https: [
    port: 5001,
    cipher_suite: :strong,
    keyfile: "priv/cert/selfsigned_key.pem",
    certfile: "priv/cert/selfsigned.pem"
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/web/assets", __DIR__)
    ]
  ]

config :web, Web.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/web/(live|views)/.*(ex)$",
      ~r"lib/web/templates/.*(eex)$"
    ]
  ]

# Configure your database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "project_core_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
