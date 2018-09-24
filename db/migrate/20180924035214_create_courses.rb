class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :title
      t.text :description
      t.belongs_to :professor_id, foreign_key: true

      t.timestamps
    end
  end
end
