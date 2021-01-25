require 'rails_helper'

RSpec.describe 'root page',type: :system do
    describe 'index page' do
        it 'shows sign in form' do
            visit root_path
            expect(page).to have_content('Sign In')
        end
    end
end