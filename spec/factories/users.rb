FactoryBot.define do
  factory :user do
    id { 1 }
    first_name { 'sample1' }
    last_name { 'sample1' }
    email { 'sample1@example.com' }
    password { '00000000' }
  end

  factory :second_user, class: User do
    id { 3 }
    user_name { 'sample2' }
    email { 'sample2@example.com' }
    password { '00000000' }
  end

  factory :third_user, class: User do
    id { 4 }
    user_name { 'sample3' }
    email { 'sample3@example.com' }
    password { '00000000' }
  end
end
