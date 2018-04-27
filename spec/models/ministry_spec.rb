require 'rails_helper'

RSpec.describe Ministry, type: :model do
  describe 'creation' do
    before do
      @ministry = FactoryBot.create(:ministry)
    end

    it 'can be created with valid parameters' do
      expect(@ministry).to be_valid
    end

    it 'cannot be created without a ministry name' do
      @ministry.name = ''
      expect(@ministry).to_not be_valid
    end

    it 'cannot be created without a director' do
      @ministry.director = nil
      expect(@ministry).to_not be_valid
    end
  end

  describe 'metrics' do
    before do
      @ministry = FactoryBot.create(:ministry)
    end
    it 'calculates the percentage of coaches that have an apprentice' do
      @role1 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Coach",
                           team_member: FactoryBot.create(:user))
      @role2 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Coach",
                           team_member: FactoryBot.create(:user))
      @role3 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Coach",
                           team_member: FactoryBot.create(:user))
      FactoryBot.create(:apprentice_relationship, role: @role1)
      expect(@ministry.percent_having_apprentice('Coach')).to eq(33)
    end

    it 'calculates the percentage of leaders that have an apprentice' do
      @role1 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Team Leader",
                           team_member: FactoryBot.create(:user))
      @role2 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Team Leader",
                           team_member: FactoryBot.create(:user))
      @role3 = Role.create(name: "Role 1",
                           ministry: @ministry,
                           role_type: "Team Leader",
                           team_member: FactoryBot.create(:user))
      FactoryBot.create(:apprentice_relationship, role: @role1)
      expect(@ministry.percent_having_apprentice('Team Leader')).to eq(33)

    end
  end
end
