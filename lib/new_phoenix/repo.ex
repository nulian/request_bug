defmodule NewPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :new_phoenix,
    adapter: Ecto.Adapters.Postgres
end
