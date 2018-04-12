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
end
