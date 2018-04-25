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

describe 'Creation', js: true do
  it 'can be added from Planning Center' do
    before_count = User.count
    user1 = FactoryBot.create(:user)
    before_count = User.count
    sign_in_with(user1.email, user1.password)
    visit users_path
    fill_in('last_name', with: 'Doggart')
    click_on('Search')
    expect(page).to have_content('test@test.com')
    click_on('Add Team Member')
    expect(User.count).to eq(before_count + 1)
    expect(page).to have_content('has been added')
  end
end

describe 'Show' do
  before do
    @user = FactoryBot.create(:user)
    @ministry = FactoryBot.create(:ministry)
    @role = Role.create(name: "Role",
                       role_type: "Coach",
                       team_member: @user,
                       ministry: @ministry)
    @role2 = Role.create(name: "Role 2",
                       role_type: "Coach",
                       team_member: FactoryBot.create(:user),
                       ministry: @ministry)

    sign_in_with(@user.email, @user.password)
    visit user_path(@user)
  end

  it 'shows the users full name on the show template' do
    expect(page).to have_content(@user.full_name)
  end

  it 'shows the users roles' do
    expect(page).to have_content(@role.name)
  end

  it 'shows where the user is apprenticing' do
    ApprenticeRelationship.create(role: @role2,
                                                            apprentice: @user)

    visit user_path(@user)
    expect(page).to have_content(@role2.name)
  end

  it 'shows who the user is apprenticing' do
    @user2 = FactoryBot.create(:user)
    ApprenticeRelationship.create(role: @role,
                                                            apprentice: @user2)
    visit user_path(@user)
    expect(page).to have_content(@user2.full_name)
  end
end

