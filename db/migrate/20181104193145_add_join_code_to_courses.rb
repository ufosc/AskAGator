class AddJoinCodeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :join_code, :string, null: false
    add_index :courses, :join_code, unique: true
  end
end
