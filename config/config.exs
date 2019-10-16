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
  secret_key_base: "apV5yno4y2Lioe8jo0nDWGJfXq7AJ079qoWDe01oABboA+ubSUwJeAiojQoVTqBI",
  render_errors: [view: AskAGatorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AskAGator.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "s3rSG2r10yr6Y4DFCAZAjt1JzJTjp83j"]

# Configures the Guardian JWT
config :ask_a_gator, AskAGator.Guardian,
  issuer: "ask_a_gator",
  secret_key: "anXVSCh81v7tKCs/ckuXVnkOKZXAzuIOZudPJaxisCZx5bPBVrvjT6SuzTeRLL/M"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
