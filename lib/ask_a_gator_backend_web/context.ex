defmodule AskAGatorBackendWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]
  alias AskAGatorBackend.Accounts.User
  alias AskAGatorBackend.Repo
  alias AskAGatorBackend.Services.Authenticator

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  def build_context(conn) do
    conn = fetch_session(conn)
    with token <- get_session(conn, :auth_token),
         {:ok, current_user} <- authorize(token) do
          %{current_user: current_user, token: token}
    else
      _ ->
        delete_session(conn, :auth_token)
        %{}
    end
  end

  defp authorize(token) do
    token
    |> Authenticator.verify_token
    |> case do
      {:ok, token} -> User
        |> where(token: ^token)
        |> Repo.one()
        |> case do
            nil -> {:error, "Invalid token"}
            user -> {:ok, user}
        end
      {_, _} -> {:error, "Invalid token"}
    end
  end
end
