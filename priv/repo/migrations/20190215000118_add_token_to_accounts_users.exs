defmodule AskAGator.Repo.Migrations.AddTokenToAccountsUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :token, :text
     end
  end
end
