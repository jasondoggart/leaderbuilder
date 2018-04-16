FactoryBot.define do
  factory :apprentice_relationship do
    role
    association :apprentice, factory: :user
  end
end
