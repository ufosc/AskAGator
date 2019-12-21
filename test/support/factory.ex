defmodule AskAGator.Factory do
  use ExMachina.Ecto, repo: AskAGator.Repo

  alias AskAGator.Accounts

  def user_factory do
    %Accounts.User{
      first_name: "Test",
      last_name: "Tester",
      email: sequence(:email, &"test-#{&1}@test.com")
    }
  end

  def set_password(user, password) do
    user
    |> Accounts.User.changeset(%{:password => password, :password_confirmation => password})
    |> Ecto.Changeset.apply_changes()
  end
end
