defmodule AskAGatorWeb.UserController do
  use AskAGatorWeb, :controller

  alias AskAGatorWeb.Plugs.AuthenticateUser
  alias AskAGator.Accounts

  plug AuthenticateUser when action in [:profile]

  def sign_up(conn, _params) do
    render(conn, "sign_up.html")
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, new_user} ->
        conn
        |> put_flash(:info, "Account created sucessfully!")
        |> put_session(:current_user, new_user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = _changeset} ->
        conn
        |> put_flash(:error, "Error creating account")
        |> redirect(to: Routes.user_path(conn, :sign_up))
    end
  end

  def profile(conn, _params) do
    render(conn, "profile.html")
  end
end
