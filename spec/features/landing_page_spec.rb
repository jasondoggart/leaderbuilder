require 'rails_helper'

describe 'navigage' do
  describe 'landing-page' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
