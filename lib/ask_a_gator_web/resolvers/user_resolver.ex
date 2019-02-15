defmodule AskAGatorWeb.UserResolver do
    alias AskAGator.Accounts.User
    alias AskAGator.Repo

    def all_users(_root, _args, _info) do
        {:ok, Repo.all(User)}
    end

    def login_with_email_pass(email, given_pass) do
        user = Repo.get_by(User, email: email)

        cond do
            user && Argon2.check_pass(given_pass,user.password_hash) ->
                {:ok, user}

            true ->
                {:error, "Email and Password combination could not be found"}
        end
    end

    def login(_root, %{email: email, password: password}, _info) do
        with {:ok, user} <- login_with_email_pass(email, password),
             {:ok, jwt, _} <- AskAGator.Guardian.encode_and_sign(user),
             {:ok, _} <- AskAGator.Accounts.store_token(user, jwt) do
                {:ok, %{token: jwt}}
        end
    end

    def logout(_root, %{context: %{current_user: current_user, token: _token}}) do
        AskAGator.Accounts.revoke_token(current_user)
        {:ok, current_user}
    end

    def logout(_args, _info) do
        {:error, "Not Signed In"}
    end
end
