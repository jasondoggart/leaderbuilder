require 'rails_helper'

RSpec.describe ApprenticeRelationship, type: :model do
  describe 'creation' do
    before do
      @apprentice_relationship = FactoryBot.create(:apprentice_relationship)
    end

    it 'can be created with valid parameters' do
      expect(@apprentice_relationship).to be_valid
    end

    it 'cannot be created without an associated role' do
      @apprentice_relationship.role = nil
      expect(@apprentice_relationship).to_not be_valid
    end

    it 'cannot be created without an apprentice' do
      @apprentice_relationship.apprentice = nil
      expect(@apprentice_relationship).to_not be_valid
    end
  end

end
