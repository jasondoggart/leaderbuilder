require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'creation' do
    before do
      @role = FactoryBot.create(:role)
    end

    it 'can be created with valid parameters' do
      expect(@role).to be_valid
    end

    it 'cannot be created without a name' do
      @role.name = ''
      expect(@role).to_not be_valid
    end

    it 'cannot be created without a ministry' do
      @role.ministry = nil
      expect(@role).to_not be_valid
    end

    it 'cannot be created without a team member' do
      @role.team_member = nil
      expect(@role).to_not be_valid
    end

    it 'cannot be created without a role type' do
      @role.role_type = ''
      expect(@role).to_not be_valid
    end
  end

end
