# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ask_a_gator_backend,
  ecto_repos: [AskAGatorBackend.Repo]

# Configures the endpoint
config :ask_a_gator_backend, AskAGatorBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DdyOTtgPd8HmyFS1slRJYUUBWf/YiJRtAcgGn+1dw6KcN4Mw4uZsvkkPOfDeKSQx",
  render_errors: [view: AskAGatorBackendWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AskAGatorBackend.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
