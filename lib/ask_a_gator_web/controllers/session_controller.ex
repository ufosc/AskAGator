defmodule AskAGatorWeb.SessionController do
  use AskAGatorWeb, :controller

  alias AskAGator.Accounts
  alias AskAGator.Accounts.User

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:current_user, user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/")
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Bad email/password combination")
        |> redirect(to: Routes.session_path(conn, :login))
    end
  end

  def logout(conn, _) do
    conn
    |> delete_session(:current_user)
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
