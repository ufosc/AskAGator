defmodule AskAGatorBackend.Repo do
  use Ecto.Repo,
    otp_app: :ask_a_gator_backend,
    adapter: Ecto.Adapters.Postgres
end
