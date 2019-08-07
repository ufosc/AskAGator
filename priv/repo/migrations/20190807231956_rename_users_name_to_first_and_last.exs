defmodule AskAGator.Repo.Migrations.RenameUsersNameToFirstAndLast do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      remove :name
    end
  end
end
