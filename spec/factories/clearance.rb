FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :first_name do |n|
    "User-#{n}"
  end

  factory :user do
    email
    password "password"
    first_name
    last_name 'User'
  end
end
