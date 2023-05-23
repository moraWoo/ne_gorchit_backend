defmodule NeGorchitApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NeGorchitApiWeb.Telemetry,
      # Start the Ecto repository
      NeGorchitApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NeGorchitApi.PubSub},
      # Start Finch
      {Finch, name: NeGorchitApi.Finch},
      # Start the Endpoint (http/https)
      NeGorchitApiWeb.Endpoint
      # Start a worker by calling: NeGorchitApi.Worker.start_link(arg)
      # {NeGorchitApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NeGorchitApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeGorchitApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
