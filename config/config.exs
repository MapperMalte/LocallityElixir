# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :locallity002,
  ecto_repos: [Locallity002.Repo]

# Configures the endpoint
config :locallity002, Locallity002Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C6EAW9HDpFCn93OCdVH23kGlkgkdtpG7VrJh3dThvTAHqFad0EHrsL6vtIuLCr7C",
  render_errors: [view: Locallity002Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Locallity002.PubSub,
  live_view: [signing_salt: "NqH+ozTh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
