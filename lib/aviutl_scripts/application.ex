defmodule AviutlScripts.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AviutlScripts.Repo,
      # Start the Telemetry supervisor
      AviutlScriptsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AviutlScripts.PubSub},
      # Start the Endpoint (http/https)
      AviutlScriptsWeb.Endpoint,
      # Start a worker by calling: AviutlScripts.Worker.start_link(arg)
      # {AviutlScripts.Worker, arg}
      {Absinthe.Subscription, AviutlScriptsWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AviutlScripts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AviutlScriptsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
