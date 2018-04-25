require 'rails_helper'
require 'support/features/clearance_helpers'
require 'spec_helper'

describe 'Planning Center Request' do
  it 'queries planning center people' do
    uri = URI('https://api.planningcenteronline.com/people/v2/people')

    response = JSON.load(Net::HTTP.get(uri))


    expect(response['data'][0]['attributes']['last_name']).to eq('Test_Result')
  end

  it 'searches planning center for a last name', js: true do
    user1 = FactoryBot.create(:user)
    sign_in_with(user1.email, user1.password)
    visit users_path
    fill_in('last_name', with: 'Doggart')
    click_on('Search')
    expect(page).to have_content('Test_Result')
    expect(page).to have_content('test@test.com')
  end
end
