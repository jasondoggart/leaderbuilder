require 'rails_helper'
require 'support/features/clearance_helpers'

describe 'Apprentice' do
  before do
    @director = FactoryBot.create(:user)
    @ministry = Ministry.create(name: 'Ministry', director: @director)
    @leader = FactoryBot.create(:user)
    @role = Role.create(name: 'Test Role',
                        role_type: 'Ministry Leader',
                        team_member: @leader,
                        ministry: @ministry)
    @apprentice = FactoryBot.create(:user)
    sign_in_with(@director.email, @director.password)
  end

  it 'can create a new apprentice for an existing role' do
    before_count = ApprenticeRelationship.count
    visit role_path(@role)
    click_on('Add Apprentice')
    expect(current_path).to eq(new_apprentice_relationship_path)
    select(@apprentice.full_name, from: 'Apprentice')
    click_on('Add Apprentice')
    expect(current_path).to eq(role_path(@role))
    expect(ApprenticeRelationship.count).to eq(before_count + 1)
    expect(page).to have_content(@apprentice.full_name)
    expect(@role.apprentice_relationships.count).to eq(1)
    expect(@apprentice.apprenticeships.count).to eq(1)
  end
end
