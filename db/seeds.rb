# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "fakeuser_1@fake.com", name: "Fake user 1", password: "password")
User.create(email: "fakeuser_2@fake.com", name: "Fake user 2", password: "password")
User.create(email: "fakeuser_3@fake.com", name: "Fake user 3", password: "password")

Account.update_all(balance: 500)
