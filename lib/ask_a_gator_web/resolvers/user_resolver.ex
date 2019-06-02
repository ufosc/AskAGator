defmodule AskAGatorWeb.UserResolver do
  alias AskAGator.Accounts.User
  alias AskAGator.Repo
  alias AskAGator.Services.Authenticator

  def all_users(_root, _info) do
    {:ok, Repo.all(User)}
  end

  def login_with_email_pass(email, given_pass) do
    user = Repo.get_by(User, email: email)

    if user && Bcrypt.verify_pass(given_pass, user.password_hash) do
      {:ok, user}
    else
      {:error, "Email and Password combination could not be found"}
    end
  end

  def login(_root, %{email: email, password: password}, _info) do
    case login_with_email_pass(email, password) do
      {:ok, user} ->
        token = Authenticator.generate_token(user.id)
        AskAGator.Accounts.store_token(user, token)

      err ->
        err
    end
  end

  def logout(_root, %{context: %{current_user: current_user, token: _token}}) do
    AskAGator.Accounts.revoke_token(current_user)
    {:ok, current_user}
  end

  def logout(_args, _info) do
    {:error, "Not Signed In"}
  end

  def current_user(_root, %{context: %{current_user: current_user, token: _token}}) do
    {:ok, current_user}
  end

  def current_user(_root, _info) do
    {:error, "Not Signed In"}
  end

  def signed_in?(_root, %{context: %{current_user: _, token: _}}) do
    {:ok, true}
  end

  def signed_in?(_root, _info) do
    {:ok, false}
  end
end
