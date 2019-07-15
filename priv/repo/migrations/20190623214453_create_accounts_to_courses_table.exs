defmodule AskAGator.Repo.Migrations.CreateAccountsToCoursesTable do
  use Ecto.Migration

  def change do
    create table(:user_course, primary_key: false) do
      add :user_id, references :users
      add :course_id, references :courses
      add :role, :integer

      timestamps()
    end

    create(index(:user_course, [:user_id]))
    create(index(:user_course, [:course_id]))

    create (
      unique_index(:user_course, [:user_id, :course_id])
    )
  end
end
