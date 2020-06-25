FactoryBot.define do
  factory :shop_owner do
    # id { 1 }
    first_name { 'sample1' }
    last_name { 'sample1' }
    email { 'sample1@example.com' }
    password { '00000000' }
    postcode { '1234567' }
    prefecture_code { '鹿児島県' }
    address_city { '鹿児島市吉野町' }
    address_street { '1-2-3' }
    address_building { 'sample1' }
    phone_number { '09012345678' }
    number_of_store { '1' }
  end

  factory :second_shop_owner, class: ShopOwner do
    # id { 2 }
    first_name { 'sample2' }
    last_name { 'sample2' }
    email { 'sample2@example.com' }
    password { '00000000' }
    postcode { '1234567' }
    prefecture_code { '鹿児島県' }
    address_city { '鹿児島市吉野町' }
    address_street { '1-2-3' }
    address_building { 'sample2' }
    phone_number { '09012345678' }
    number_of_store { '1' }
  end
end