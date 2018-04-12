FactoryBot.define do
  factory :role do
    name "MyString"
    role_type "Coach"
    association :team_member, factory: :user
    ministry
  end
end
