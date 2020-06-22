# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do |n|
#   name = Faker::JapaneseMedia::DragonBall
#   first_name = Faker::Name.last_name
#   last_name = Faker::Name.first_name
#   email = Faker::Internet.email
#   postcode = Faker::Address.postcode
#   prefecture_code = Faker::Address.state
#   address_city = Faker::Address.city_prefix
#   address_street = Faker::Address.state_abbr
#   content = "Hogehoge"
#   phone_number = Faker::PhoneNumber.phone_number
#   password = Faker::Internet.password

  Shop.create(
    name: "アイウエオ",
    postcode: "12345678",
    prefecture_code: "鹿児島県",
    address_city: "鹿児島市吉野町",
    address_street: "1-2-3",
    phone_number: "09040071234",
    introduction: "美味しい"
  )
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
