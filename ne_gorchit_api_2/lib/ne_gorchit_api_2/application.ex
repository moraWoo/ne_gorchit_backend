defmodule NeGorchitApi2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NeGorchitApi2Web.Telemetry,
      # Start the Ecto repository
      NeGorchitApi2.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NeGorchitApi2.PubSub},
      # Start Finch
      {Finch, name: NeGorchitApi2.Finch},
      # Start the Endpoint (http/https)
      NeGorchitApi2Web.Endpoint
      # Start a worker by calling: NeGorchitApi2.Worker.start_link(arg)
      # {NeGorchitApi2.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NeGorchitApi2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeGorchitApi2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
