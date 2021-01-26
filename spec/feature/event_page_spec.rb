require 'rails_helper'

RSpec.describe 'Event Page', type: :system do
  describe 'user page has event create link' do
    before :all do
      User.create!(username: 'tester')
    end
    it 'has a link Create Event' do
      visit root_path
      fill_in 'username', with: 'tester'
      click_button 'Proceed'
      expect(page.current_path).to eq(user_path(User.find_by(username: 'tester').id))
      expect(page).to have_link('Create event')
    end

    it 'clicking on Create event takes to user_event_index_path' do
      visit root_path
      fill_in 'username', with: 'tester'
      click_button 'Proceed'
      click_link 'Create event'
      expect(page.current_path).to eq(new_user_event_path(User.find_by(username: 'tester').id))
    end
  end
end
