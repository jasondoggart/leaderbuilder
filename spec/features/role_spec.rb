require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'Role' do
  before do
    @user = FactoryBot.create(:user)
    sign_in_with(@user.email, @user.password)
    @ministry = FactoryBot.create(:ministry, director: @user)
    @user2 = FactoryBot.create(:user)
  end

  it 'can be created for a ministry' do
    before_count = Role.count
    visit ministry_path(@ministry)
    click_link('Add new role')
    expect(current_path).to eq(new_role_path)
    fill_in('Name', with: 'New role')
    select('Coach', from: 'Role Type')
    select(@user2.full_name, from: 'role_team_member_id')
    click_on('Add Role')
    expect(Role.count).to eq(before_count + 1)
    expect(Role.last.ministry).to eq(@ministry)
    expect(current_path).to eq(ministry_path(@ministry))
    expect(page).to have_content('New role')
  end

  it 'can be updated' do
    role = FactoryBot.create(:role)
    visit edit_role_path(role)
    fill_in('Name', with: 'New name')
    click_on('Update Role')
    expect(current_path).to eq(ministry_path(role.ministry))
    expect(page).to have_content('New name')
  end

  it 'has a show page' do
    role = FactoryBot.create(:role)
    visit role_path(role)
    expect(current_path).to eq(role_path(role))
  end

  it 'shows the coach if the role_type is Team Leader' do
    leader_role = FactoryBot.create(:role,
                                    ministry: @ministry,
                                    role_type: 'Team Leader')
    coach_role = FactoryBot.create(:role,
                                   ministry: @ministry,
                                   role_type: 'Coach')
    RoleRelationship.create(following_role: leader_role, leading_role: coach_role)
    visit role_path(leader_role)
    expect(page).to have_content('Coach')
    expect(page).to have_content(coach_role.team_member.full_name + " - " + coach_role.name)

  end
end
