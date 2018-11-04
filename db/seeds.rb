# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Role.create(id: 0, name: 'Admin')
professor = Role.create(id: 1, name: 'Professor')
student = Role.create(id: 2, name: 'Student')
admin.save
professor.save
student.save

courses = []

for i in 1000..1010 do
    courses << Course.create(course_code: "COP#{i}", title: "Test course #{i}", description: "Wow this is a test for #{i}")
end

User.create!(first_name: 'Admin', middle_name: 'admin', last_name: 'admin', email: 'root@school.edu', password: 'rootpass', password_confirmation: 'rootpass', primary_role: admin)
prof = User.create!(first_name: 'Profey', middle_name: 'the', last_name: 'Professor', email: 'prof@school.edu', password: 'rootpass', password_confirmation: 'rootpass', primary_role: professor)
prof.professor_courses << courses
User.create!(first_name: 'Stud', middle_name: 'the', last_name: 'Student', email: 'stud@school.edu', password: 'rootpass', password_confirmation: 'rootpass', primary_role: student)
User.create!(first_name: 'Nobody', middle_name: 'the', last_name: 'lame', email: 'lame@school.edu', password: 'rootpass', password_confirmation: 'rootpass', primary_role: nil)
