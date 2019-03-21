defmodule AskAGatorWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]
  alias AskAGator.Accounts.User
  alias AskAGator.Repo

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      %{current_user: current_user, token: token}
    else
      _ -> %{}
    end
  end

  defp authorize(token) do
    User
    |> where(token: ^token)
    |> Repo.one()
    |> case do
      nil -> {:error, "Invalid authorization token"}
      user -> {:ok, user}
    end
  end
end
