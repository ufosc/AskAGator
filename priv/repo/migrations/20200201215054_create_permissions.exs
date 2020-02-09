defmodule AskAGator.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions) do
      add :auth_entity_id, :integer
      add :auth_entity_type, :string
      add :perm_entity_id, :integer
      add :perm_entity_type, :string
      add :permission_value, :string

      timestamps()
    end

    create index :permissions, [:auth_entity_id, :auth_entity_type]
  end
end
