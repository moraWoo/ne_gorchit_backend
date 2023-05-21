defmodule NeGorchitBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NeGorchitBackendWeb.Telemetry,
      # Start the Ecto repository
      NeGorchitBackend.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NeGorchitBackend.PubSub},
      # Start Finch
      {Finch, name: NeGorchitBackend.Finch},
      # Start the Endpoint (http/https)
      NeGorchitBackendWeb.Endpoint
      # Start a worker by calling: NeGorchitBackend.Worker.start_link(arg)
      # {NeGorchitBackend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NeGorchitBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeGorchitBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
