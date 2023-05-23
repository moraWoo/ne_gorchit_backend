defmodule NeGorchitApi.Repo do
  use Ecto.Repo,
    otp_app: :ne_gorchit_api,
    adapter: Ecto.Adapters.Postgres
end
