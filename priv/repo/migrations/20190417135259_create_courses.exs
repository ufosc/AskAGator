defmodule AskAGator.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :code, :string
      add :join_code, :string

      timestamps()
    end

  end
end
