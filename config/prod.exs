use Mix.Config

core_database_url =
  System.get_env("CORE_DATABASE_URL") ||
    raise("""
    environment variable CORE_DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """)

config :core, Core.Repo,
  # ssl: true,
  url: core_database_url,
  pool_size: String.to_integer(System.get_env("CORE_POOL_SIZE") || "10")

# Configures the Panel Endpoint
panel_secret_key_base =
  System.get_env("PANEL_SECRET_KEY_BASE") ||
    raise """
    environment variable PANEL_SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :panel, Panel.Endpoint,
  url: [host: "panel.example.com", port: 80],
  http: [
    port: String.to_integer(System.get_env("PANEL_PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: panel_secret_key_base,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true

# Configures the Web Endpoint
web_secret_key_base =
  System.get_env("WEB_SECRET_KEY_BASE") ||
    raise """
    environment variable WEB_SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :web, Web.Endpoint,
  url: [host: "example.com", port: 80],
  http: [
    port: String.to_integer(System.get_env("WEB_PORT") || "5000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: web_secret_key_base,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true
