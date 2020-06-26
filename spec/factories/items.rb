FactoryBot.define do
  factory :item do
    name { 'sample1' }
    price { '100' }
    stock { '10' }
    remark { 'sample1' }
    # shop {} 
  end

  factory :second_item, class: Item do
    name { 'sample2' }
    price { '100' }
    stock { '10' }
    remark { 'sample2' }
    # shop {} 
  end
end