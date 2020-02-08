# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin.com",
  password: "password"
)

5.times do |n|
  email = "user#{n+1}@user.com"
  password = "password"
  User.create!(
    email: email,
    password: password,
    password_confirmation: password
  )
end

# 20.times do
#   admin.products.create!(
#       name: Faker::Book.title,
#       description: Faker::Lorem.paragraph(2),
#       price: Faker::Number.within(100..100000),
#       unit: %w(yen usd).sample,
#       image: "sample.jpg"
#     )
# end