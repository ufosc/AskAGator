class AddCourseIdToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :course_id, :integer
  end
end
