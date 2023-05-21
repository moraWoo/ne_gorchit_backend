defmodule NeGorchitBackend.Repo do
  use Ecto.Repo,
    otp_app: :ne_gorchit_backend,
    adapter: Ecto.Adapters.Postgres
end
