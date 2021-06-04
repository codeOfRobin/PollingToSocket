use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :polling_to_socket, PollingToSocketWeb.Endpoint,
  http: [port: 4002],
  server: false

config :polling_to_socket, :httpoison, MockHTTPoison

# Print only warnings and errors during test
config :logger, level: :warn
