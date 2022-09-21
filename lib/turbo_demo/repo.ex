defmodule TurboDemo.Repo do
  use Ecto.Repo,
    otp_app: :turbo_demo,
    adapter: Ecto.Adapters.Postgres
end
