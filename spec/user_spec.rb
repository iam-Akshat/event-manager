require 'rails_helper'

RSpec.describe User do
  context 'validates required fields' do
    it 'returns false when username is not present' do
      user = User.new
      expect(user.valid?).to eq(false)
    end
    it 'returns true when username is present' do
      user = User.new
      user.username = 'valid'
      expect(user.valid?).to eq(true)
    end
  end
end
