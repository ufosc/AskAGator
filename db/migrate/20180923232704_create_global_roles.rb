class CreateGlobalRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :global_roles do |t|
      t.string :name
      t.integer :rank
    end
    create_join_table :global_roles, :users
  end
end
