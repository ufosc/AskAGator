# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate the default roles.
Role.create(name: "SysAdmin", rank: 99, scope: 'system')
Role.create(name: "UnivAdmin", rank: 10, scope: 'school')
Role.create(name: "Professor", rank: 5, scope: 'school')
Role.create(name: "Student", rank: 1, scope: 'school')
Role.create(name: "TA", rank: 4, scope: 'course')
