defmodule AskAGator.Repo.Migrations.AddUniqueIndexToUser do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:token])
  end
end
