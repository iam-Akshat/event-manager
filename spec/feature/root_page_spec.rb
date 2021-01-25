require 'rails_helper'

RSpec.describe 'root page',type: :system do
    describe 'index page' do
        it 'shows sign in form' do
            visit root_path
            expect(page).to have_content('Sign In')
            expect(page).to have_field('username')
            expect(page).to have_button('Proceed')
        end
    end
    describe 'login form' do
      let(:user){ a = User.create!(username:'akshat') }
      it 'redirects to root_path if user does not exists' do
        visit root_path
        fill_in 'username',with: 'nonexisting'
        click_button 'Proceed'
        fill_in 'username' ,with: 'wait'
        expect(page.current_path).to eq('/')
      end

      it 'redirects to user_path if user exists also checks sign up' do
          
          visit root_path
          click_link 'Sign Up'
          fill_in 'username',with: 'akshat'
          expect(page).to have_content('Sign Up')
          click_button 'Proceed'
          fill_in 'username',with: 'akshat'
          click_button 'Proceed'
          
          expect(page.current_path).to eq(user_path(1))
        end
      it 'All Events link redirect to event_index_path' do
        visit root_path

        click_link 'All events'
        expect(page).to have_content('Old Events')
        expect(page).to have_content('Upcoming Events')
      end
    end
end