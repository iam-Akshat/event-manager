require 'rails_helper'

RSpec.describe 'Session Authentication', type: :system do
  describe 'sign up' do
    it 'does not submit if user is empty' do
      visit sign_up_path
      click_button 'Proceed'
      expect(page.current_path).to eq(sign_up_path)
    end

    it 'redirects to sign_in_path after succesfully creating a user' do
      visit sign_up_path
      fill_in 'username', with: 'tester'
      click_button 'Proceed'
      expect(page.current_path).to eq(sign_in_path)
    end

    it 'logout redirects to root_path' do
      visit sign_up_path
      fill_in 'username', with: 'tester'
      click_button 'Proceed'
      fill_in 'username', with: 'tester'
      click_button 'Proceed'
      click_link 'Logout'
      fill_in 'username', with: 'done'
      expect(page.current_path).to eq(sign_in_path)
    end
  end
end
