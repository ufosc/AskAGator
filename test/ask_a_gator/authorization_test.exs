defmodule AskAGator.AuthorizationTest do
  use AskAGator.DataCase

  alias AskAGator.Authorization

  describe "permissions" do
    alias AskAGator.Authorization.Permission

    @valid_attrs %{auth_entity_id: 42, auth_entity_type: "some auth_entity_type", perm_entity_id: 42, perm_entity_type: "some perm_entity_type", permission_value: "some permission_value"}
    @update_attrs %{auth_entity_id: 43, auth_entity_type: "some updated auth_entity_type", perm_entity_id: 43, perm_entity_type: "some updated perm_entity_type", permission_value: "some updated permission_value"}
    @invalid_attrs %{auth_entity_id: nil, auth_entity_type: nil, perm_entity_id: nil, perm_entity_type: nil, permission_value: nil}

    def permission_fixture(attrs \\ %{}) do
      {:ok, permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Authorization.create_permission()

      permission
    end

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Authorization.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Authorization.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      assert {:ok, %Permission{} = permission} = Authorization.create_permission(@valid_attrs)
      assert permission.auth_entity_id == 42
      assert permission.auth_entity_type == "some auth_entity_type"
      assert permission.perm_entity_id == 42
      assert permission.perm_entity_type == "some perm_entity_type"
      assert permission.permission_value == "some permission_value"
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authorization.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{} = permission} = Authorization.update_permission(permission, @update_attrs)
      assert permission.auth_entity_id == 43
      assert permission.auth_entity_type == "some updated auth_entity_type"
      assert permission.perm_entity_id == 43
      assert permission.perm_entity_type == "some updated perm_entity_type"
      assert permission.permission_value == "some updated permission_value"
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Authorization.update_permission(permission, @invalid_attrs)
      assert permission == Authorization.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Authorization.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Authorization.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Authorization.change_permission(permission)
    end
  end
end
