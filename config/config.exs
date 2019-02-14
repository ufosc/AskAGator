# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ask_a_gator,
  ecto_repos: [AskAGator.Repo]

# Configures the endpoint
config :ask_a_gator, AskAGatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xIkpmfkE5CaT/r3rQe8kWHF8eakjkMzNooe0UMtOIPf4cPSvmJpIGEvitlZsqKZ3",
  render_errors: [view: AskAGatorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AskAGator.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "AskAGator",
  secret_key: "uUuEt3n7CZ8MFVkIgc2VR9giDlczGIidgVytW1j4eYMB/gcgH5xZtyjQXIlmmIgp"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
