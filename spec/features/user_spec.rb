require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'User' do
  it 'has an index page that shows all users' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    user3 = FactoryBot.create(:user)
    sign_in_with(user1.email, user1.password)
    visit users_path
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.email)
  end
end
