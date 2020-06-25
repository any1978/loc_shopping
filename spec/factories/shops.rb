FactoryBot.define do
  factory :shop do
    # id { 1 }
    name { 'sample1' }
    introduction { 'sample1' }
    postcode { '1234567' }
    prefecture_code { '鹿児島県' }
    address_city { '鹿児島市吉野町' }
    address_street { '1-2-3' }
    address_building { 'sample1' }
    phone_number { '09012345678' }
    shop_owner {} 
  end

  factory :second_shop, class: Shop do
    # id { 2 }
    name { 'sample2' }
    introduction { 'sample2' }
    postcode { '1234567' }
    prefecture_code { '東京都' }
    address_city { '杉並区下高井戸' }
    address_street { '1-2-3' }
    address_building { 'sample2' }
    phone_number { '09012345678' }
    shop_owner {} 
  end
end