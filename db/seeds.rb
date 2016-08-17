# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin user
User.create!(
  firstname: 'Adrian ',
  lastname: 'Manteza',
  email: 'admin@admin.com',
  password: '123',
  admin: true
)

# Normal user
20.times do 
  User.create!(
  firstname: 'Random',
  lastname: 'Person',
  email: 'rando@example.com',
  password: '123',
  admin: false
)
end
