require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'Create' do
  before do
    @director = FactoryBot.create(:user)
    @ministry = Ministry.create(name: 'Ministry', director: @director)
    @coach = FactoryBot.create(:user)
    @leader = FactoryBot.create(:user, first_name: "Leader", last_name: "Person")
    @member = FactoryBot.create(:user, first_name: "Member", last_name: "Person")
    @role = Role.create(
      name: 'Coach role',
      role_type: 'Coach',
      team_member: @coach,
      ministry: @ministry
    )
    @role2 = Role.create(
      name: 'Leader role',
      role_type: 'Team Leader',
      team_member: @leader,
      ministry: @ministry
    )
    @role3 = Role.create(
      name: 'Team Member Role',
      role_type: 'Team Member',
      team_member: @member,
      ministry: @ministry
    )
    sign_in_with(@director.email, @director.password)
  end

  it 'has the option to add a coaching relationship if the role is coach or team leader' do
    visit role_path(@role)
    expect(page).to have_content('Link a role')
  end

  it 'does not have the option to link team leaders if the role_type is team member' do
    visit role_path(@role3)
    expect(page).to_not have_content('Link a role')
  end

  it 'shows team leaders linked to a coach role' do
    RoleRelationship.create(leading_role: @role,
                            following_role: @role2)
    visit role_path(@role)
    expect(page).to have_content(@role2.name)
  end

  it 'takes you to the new relationship page' do
    RoleRelationship.create(leading_role: @role,
                            following_role: @role2)
    visit role_path(@role)
    click_on('Link a role')
    expect(current_path).to eq(new_role_relationship_path)
  end

  it 'can select from only team leaders if the leader is a coach' do
    visit role_path(@role)
    click_on('Link a role')
    expect(page).to have_select('role_relationship_following_role_id', with_options: ['Leader Person - Leader role'])
    expect(page).to_not have_select('role_relationship_following_role_id', with_options: ['Member Person - Team Member Role'])
  end

  it 'can select from only team members if the leader is a team leader' do
    visit role_path(@role2)
    click_on('Link a role')
    expect(page).to have_select('role_relationship_following_role_id', with_options: ['Member Person - Team Member Role'])
    expect(page).to_not have_select('role_relationship_following_role_id', with_options: ['Leader Person - Leader role'])

  end

  it 'can create a new role relationship' do
    before_count = RoleRelationship.count
    visit role_path(@role)
    click_on('Link a role')
    select('Leader Person - Leader role', from: 'role_relationship_following_role_id')
    click_on('Link Role')
    expect(current_path).to eq(role_path(@role))
    expect(RoleRelationship.count).to eq(before_count + 1)
  end

  it 'shows all linked roles on the role show page' do
    visit role_path(@role)
    click_on('Link a role')
    select('Leader Person - Leader role', from: 'role_relationship_following_role_id')
    click_on('Link Role')
    expect(page).to have_content('Leader Person')
  end



end
