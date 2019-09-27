# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AskAGatorBackend.Repo.insert!(%AskAGatorBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias AskAGatorBackend.Accounts.User
alias AskAGatorBackend.Courses.Course

AskAGatorBackend.Repo.insert! User.changeset(%User{}, %{first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password"})
AskAGatorBackend.Repo.insert! User.changeset(%User{}, %{first_name: "Test2", last_name: "Tester", email: "test2@test.com", password: "password", password_confirmation: "password"})
AskAGatorBackend.Repo.insert! Course.changeset(%Course{}, %{code: "COP1234", name: "Programming 1234", join_code: "testcode"})
