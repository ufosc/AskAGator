defmodule AskAGator.Authorization.Permission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "permissions" do
    field :auth_entity_id, :integer
    field :auth_entity_type, :string
    field :perm_entity_id, :integer
    field :perm_entity_type, :string
    field :permission_value, :string

    timestamps()
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:auth_entity_id, :auth_entity_type, :perm_entity_id, :perm_entity_type, :permission_value])
    |> validate_required([:auth_entity_id, :auth_entity_type, :perm_entity_id, :perm_entity_type, :permission_value])
  end
end
