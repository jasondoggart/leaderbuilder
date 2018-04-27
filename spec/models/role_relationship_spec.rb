require 'rails_helper'

RSpec.describe RoleRelationship, type: :model do
  before do
    @role_relationship = RoleRelationship.create(leading_role: FactoryBot.create(:role), following_role: FactoryBot.create(:role))
  end

  it 'can be created with valid parameters' do
    expect(@role_relationship).to be_valid
  end
end
