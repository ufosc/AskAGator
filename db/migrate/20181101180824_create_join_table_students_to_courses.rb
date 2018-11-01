class CreateJoinTableStudentsToCourses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :courses, table_name: :students_to_courses do |t|
      t.index :user_id
      t.index :course_id
    end
  end
end
