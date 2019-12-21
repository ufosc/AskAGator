defmodule AskAGator.Repo do
  use Ecto.Repo,
    otp_app: :ask_a_gator,
    adapter: Ecto.Adapters.Postgres
end
