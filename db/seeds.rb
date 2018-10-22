# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Role.create(id: 0, name: 'Admin')
admin.save # To be sure
Role.create!(id: 1, name: 'Professor')
Role.create!(id: 2, name: 'Student')

User.create!(first_name: 'Admin', middle_name: 'admin', last_name: 'admin', email: 'root@school.edu', password: 'rootpass', password_confirmation: 'rootpass', primary_role: Role.first)
