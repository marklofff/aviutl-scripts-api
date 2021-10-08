import Config

# Configure your database
config :aviutl_scripts, AviutlScripts.Repo,
  username: System.get_env("POSTGRES_USER") || "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  database: System.get_env("POSTGRES_DB") || "aviutl_scripts_dev",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :aviutl_scripts, AviutlScriptsWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "qsf+DzNNrkRNlO/r9ojhcfbzfDm73W7Ydvxu2TlgtdKeSyDU2O/gY4pcLqR2P8YG",
  pubsub_server: AviutlScripts.PubSub,
  watchers: []

config :aviutl_scripts, AviutlScripts.Guardian,
       issuer: "aviutl_scripts",
       secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
