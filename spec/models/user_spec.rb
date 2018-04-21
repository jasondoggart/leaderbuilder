require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'can be created with valid parameters' do
      expect(@user).to be_valid
    end

    it 'cannot be created without a first name' do
      @user.first_name = ''
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a last name' do
      @user.last_name = ''
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a planning center id' do
      @user.pc_id = ''
      expect(@user).to_not be_valid
    end
  end

  describe 'order' do
    it 'users created last should appear first in order' do
      user1 = User.create(first_name: 'Test', last_name: 'User',
                          email: 'test1@test.com', pc_id: 1,
                          password: 'password', created_at: 3.day.ago)
      user2 = User.create(first_name: 'Test', last_name: 'User',
                          email: 'test2@test.com', pc_id: 2,
                          password: 'password', created_at: 2.day.ago)
      user3 = User.create(first_name: 'Test', last_name: 'User',
                          email: 'test3@test.com', pc_id: 3,
                          password: 'password', created_at: 1.day.ago)
      expect(User.first).to eq(user3)
    end
  end
end
