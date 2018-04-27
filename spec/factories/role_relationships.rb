FactoryBot.define do
  factory :role_relationship do
    role
    association :member, factory: :user
  end
end
