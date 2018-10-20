class CreateRolesAndPermissions < ActiveRecord::Migration[5.2]
  def change
    drop_table :roles_users
    drop_table :roles

    create_table :roles do |t|
      t.string :name
    end

    create_table :permissions do |t|
      t.string :name
      t.integer :perm_type
      t.integer :target
    end

    create_join_table :users, :roles
    create_join_table :users, :permissions

    add_reference :users, :primary_role, foreign_key: { to_table: :roles}
  end
end
