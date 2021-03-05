defmodule Locallity002.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Locallity002.Repo,
      # Start the Telemetry supervisor
      Locallity002Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Locallity002.PubSub},
      # Start the Endpoint (http/https)
      Locallity002Web.Endpoint
      # Start a worker by calling: Locallity002.Worker.start_link(arg)
      # {Locallity002.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Locallity002.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Locallity002Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
