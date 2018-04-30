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
    expect(current_path).to eq(role_path(role))
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

  it 'has an update role page' do
    role = FactoryBot.create(:role)
    visit role_path(role)
    click_on('update_role_link')
    expect(current_path).to eq(update_role_path)
  end

  it 'can delete a role if it was added by mistake' do
    role = FactoryBot.create(:role)
    ministry = role.ministry
    before_count = Role.count
    visit update_role_path(:role => role)
    click_on('delete_mistakenly_added')
    expect(Role.count).to eq(before_count - 1)
    expect(current_path).to eq(ministry_path(ministry))
  end

  it 'removes all role relationships when deleted' do
    leading_role = FactoryBot.create(:role, role_type: 'Coach')
    following_role = FactoryBot.create(:role, role_type: 'Team Leader')
    RoleRelationship.create(leading_role: leading_role, following_role: following_role)
    visit update_role_path(:role => leading_role)
    click_on('delete_mistakenly_added')
    expect(RoleRelationship.count).to eq(0)
  end

  it 'removes all apprentice relationships when deleted' do
    leading_role = FactoryBot.create(:role, role_type: 'Coach')
    apprentice_role = FactoryBot.create(:role, role_type: 'Team Leader')
    ApprenticeRelationship.create(role: leading_role,
                                  apprentice: apprentice_role.team_member)
    visit update_role_path(:role => leading_role)
    click_on('delete_mistakenly_added')
    expect(leading_role.apprentice_relationships.count).to eq(0)
  end

  it 'sets the role active status to false if the role is not longer active' do
    role = FactoryBot.create(:role)
    ministry = role.ministry
    visit update_role_path(:role => role)
    click_on('set_role_to_inactive')
    expect(role.reload.active).to eq(false)
    expect(current_path).to eq(ministry_path(ministry))
  end

  it 'sets set_inactive_at to now when role marked as inactive' do
    role = FactoryBot.create(:role)
    visit update_role_path(:role => role)
    click_on('set_role_to_inactive')
    expect(role.reload.set_inactive_at).to_not eq(nil)

  end

  it 'removes all role relationships when role active status is changed to false' do
    leading_role = FactoryBot.create(:role, role_type: 'Coach')
    following_role = FactoryBot.create(:role, role_type: 'Team Leader')
    RoleRelationship.create(leading_role: leading_role, following_role: following_role)
    visit update_role_path(:role => leading_role)
    click_on('set_role_to_inactive')
    expect(leading_role.following_relationships.count).to eq(0)
  end

  it 'removes all apprentice relationships when role active statis changed to false' do
    leading_role = FactoryBot.create(:role, role_type: 'Coach')
    apprentice_role = FactoryBot.create(:role, role_type: 'Team Leader')
    ApprenticeRelationship.create(role: leading_role,
                                  apprentice: apprentice_role.team_member)
    visit update_role_path(:role => leading_role)
    click_on('set_role_to_inactive')
    expect(leading_role.apprentice_relationships.count).to eq(0)
  end

  it 'can have its title edited' do
    role = FactoryBot.create(:role)
    visit update_role_path(role: role)
    click_on('edit_role_title')
    expect(current_path).to eq(edit_role_path(role))
    fill_in('Role Name', with: 'New title')
    click_on('Update Role')
    expect(current_path).to eq(role_path(role))
    expect(role.reload.name).to eq('New title')
  end
end
