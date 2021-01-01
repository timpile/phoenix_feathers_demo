defmodule PhoenixFeathersDemo.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_feathers_demo,
    adapter: Ecto.Adapters.Postgres
end
