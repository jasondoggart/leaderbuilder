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
    select(@user.full_name, from: 'ministry_director_id')
    click_on('Add Ministry')
    expect(Ministry.count).to eq(before_count + 1)
    expect(current_path).to eq(ministry_path(Ministry.last))
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

  it 'has an index page that shows all ministries' do
    ministry1 = FactoryBot.create(:ministry)
    ministry2 = FactoryBot.create(:ministry)
    ministry3 = FactoryBot.create(:ministry)
    visit ministries_path
    expect(page).to have_content(ministry1.name)
    expect(page).to have_content(ministry2.name)
    expect(page).to have_content(ministry3.name)
  end

  it 'has a show page that lists all associated roles' do
    ministry = FactoryBot.create(:ministry)
    role1 = FactoryBot.create(:role, ministry: ministry)
    role2 = FactoryBot.create(:role, ministry: ministry)
    role3 = FactoryBot.create(:role, ministry: ministry)
    visit ministry_path(ministry)
    expect(page).to have_content(role1.name)
    expect(page).to have_content(role2.name)
    expect(page).to have_content(role3.name)
  end

  it 'shows only active roles' do
    ministry = FactoryBot.create(:ministry)
    active_role = FactoryBot.create(:role, ministry: ministry)
    inactive_role = FactoryBot.create(:role, ministry: ministry, active: false)
    visit ministry_path(ministry)
    expect(page).to have_content(active_role.team_member.full_name)
    expect(page).to_not have_content(inactive_role.team_member.full_name)
  end

end
