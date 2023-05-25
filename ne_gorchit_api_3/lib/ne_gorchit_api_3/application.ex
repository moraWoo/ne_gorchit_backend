defmodule NeGorchitApi3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NeGorchitApi3Web.Telemetry,
      # Start the Ecto repository
      NeGorchitApi3.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NeGorchitApi3.PubSub},
      # Start Finch
      {Finch, name: NeGorchitApi3.Finch},
      # Start the Endpoint (http/https)
      NeGorchitApi3Web.Endpoint
      # Start a worker by calling: NeGorchitApi3.Worker.start_link(arg)
      # {NeGorchitApi3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NeGorchitApi3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeGorchitApi3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
