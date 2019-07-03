defmodule AcApi.Repo do
  use Ecto.Repo,
    otp_app: :ac_api,
    adapter: Ecto.Adapters.Postgres
end
