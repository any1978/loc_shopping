# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do |n|
#   last_name = Faker::Name.last_name
#   first_name = Faker::Name.first_name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   postcode = Faker::Address.postcode
#   prefecture_code = Faker::Address.state
#   address_city = Faker::Address.city_prefix
#   address_street = Faker::Address.state_abbr
#   phone_number = Faker::PhoneNumber.phone_number

#   User.create!(first_name: first_name,
#               last_name: last_name,
#               email: email,
#               password: password,
#               password_confirmation: password,
#               prefecture_code: prefecture_code,
#               address_city: address_city,
#               address_street: address_street,
#               phone_number: phone_number,
#   )
# end

require "csv"
CSV.foreach('db/seeds/csv/user.csv', headers: true) do |row|
  User.create(
    id: row['id'],
    first_name: row['first_name'],
    last_name: row['last_name'],
    email: row['email'],
    password: row['password'],
    password_confirmation: row['password'],
    postcode: row['postcode'],
    prefecture_code: row['prefecture_code'],
    address_city: row['address_city'],
    address_street: row['address_street'],
    phone_number: row['phone_number']
  )
end


CSV.foreach('db/seeds/csv/shop_owner.csv', headers: true) do |row|
  ShopOwner.create(
    id: row['id'],
    first_name: row['first_name'],
    last_name: row['last_name'],
    image: File.open(row['image']),
    email: row['email'],
    password: row['password'],
    password_confirmation: row['password'],
    postcode: row['postcode'],
    prefecture_code: row['prefecture_code'],
    address_city: row['address_city'],
    address_street: row['address_street'],
    phone_number: row['phone_number'],
    number_of_store: row['number_of_store']
  )
end

CSV.foreach('db/seeds/csv/shop.csv', headers: true) do |row|
  Shop.create(
    id: row['id'],
    name: row['name'],
    introduction: row['introduction'],
    image: File.open(row['image']),
    postcode: row['postcode'],
    prefecture_code: row['prefecture_code'],
    address_city: row['address_city'],
    address_street: row['address_street'],
    phone_number: row['phone_number'],
    shop_owner_id: row['shop_owner_id']
  )
end



# 30.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(user_name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end

# 20.times do |n|
#   User.create!(
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(user_name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end



  # Shop.create(
  #   name: "アイウエオ",
  #   postcode: "12345678",
  #   prefecture_code: "鹿児島県",
  #   address_city: "鹿児島市吉野町",
  #   address_street: "1-2-3",
  #   phone_number: "09040071234",
  #   introduction: "美味しい"
  # )
# end

# Item.delete_all

# Item.create!(
# 	id: 002,
# 	name: 'りんご',
# 	remark: %{ 美味しいりんごです },
# 	image: 'apple.jpg',
#   price: 200,
#   stock: 10,
# 	created_at: '2020-04-14 02:36:00 UTC',
# 	updated_at: '2020-04-14 02:36:00 UTC'
# )

# Item.create!(
# 	id: 003,
# 	name: 'バナナ',
# 	remark: %{ 美味しいバナナです },
# 	image: 'banana.jpg',
#   price: 150,
#   stock: 10,
# 	created_at: '2020-04-14 02:36:00 UTC',
#   updated_at: '2020-04-14 02:36:00 UTC',
#   shop_id: 001
# )

# Item.create!(
# 	id: 004,
# 	title: 'ピーマン',
# 	remark: %{ 苦いピーマンです },
# 	image: 'pi_man.jpg',
#   price: 100,
#   stock: 10,
# 	created_at: '2020-04-14 02:36:00 UTC',
#   updated_at: '2020-04-14 02:36:00 UTC',
#   shop_id: 001
# )
