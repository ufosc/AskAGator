# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AskAGator.Repo.insert!(%AskAGator.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias AskAGator.Accounts.User
alias AskAGator.Courses.Course

AskAGator.Repo.insert! User.changeset(%User{}, %{first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password"})
AskAGator.Repo.insert! User.changeset(%User{}, %{first_name: "Test2", last_name: "Tester", email: "test2@test.com", password: "password", password_confirmation: "password"})
AskAGator.Repo.insert! Course.changeset(%Course{}, %{code: "COP1234", name: "Programming 1234", join_code: "testcode"})
