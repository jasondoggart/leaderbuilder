FactoryBot.define do
  factory :ministry do
    name "MyString"
    association :director, factory: :user
  end
end
