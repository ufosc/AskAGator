class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :rank
      t.integer :scope

      t.timestamps
    end

    create_join_table :users, :roles do |t|
      t.index :user_id
      t.index :role_id
    end
  end
end
