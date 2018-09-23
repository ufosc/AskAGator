# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate the default global roles.
GlobalRole.create(name: "SysAdmin", rank: -1)
GlobalRole.create(name: "UnivAdmin", rank: 1)
GlobalRole.create(name: "Professor", rank: 2)
GlobalRole.create(name: "Student", rank: 3)
