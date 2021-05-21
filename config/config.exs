# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :polling_to_socket, PollingToSocketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R/Cu+fho8/dto3XgLt+xT1D4R6ebaxlJVDzd+wwIDYPYa0B4UOE5WkO+3UM5Lge9",
  render_errors: [view: PollingToSocketWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PollingToSocket.PubSub,
  live_view: [signing_salt: "sISu7QdF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
