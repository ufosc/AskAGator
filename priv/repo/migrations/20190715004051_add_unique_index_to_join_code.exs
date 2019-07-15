defmodule AskAGator.Repo.Migrations.AddUniqueIndexToJoinCode do
  use Ecto.Migration

  def change do
    create unique_index(:courses, [:join_code])
  end
end
