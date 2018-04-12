require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'Mininstry' do
  before do
    @user = FactoryBot.create(:user)
    sign_in_with(@user.email, @user.password)
  end
  it 'Can be created' do
    before_count = Ministry.count
    visit new_ministry_path
    fill_in('Ministry Name', with: 'Ministry')
    click_on('Add Ministry')
    expect(current_path).to eq(ministry_path(Ministry.last))
    expect(Ministry.count).to eq(before_count + 1)
    expect(page).to have_content(Ministry.last.name)
  end

  it 'can be updated' do
    ministry = FactoryBot.create(:ministry)
    visit edit_ministry_path(ministry)
    fill_in('Ministry Name', with: 'New name')
    click_on('Update Ministry')
    expect(current_path).to eq(ministry_path(ministry))
    expect(page).to have_content('New name')
  end

end
