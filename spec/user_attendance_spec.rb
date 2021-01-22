require 'rails_helper'

RSpec.describe UserAttendance do
  let(:ua) { UserAttendance.new }
  let(:user) { User.create(username: 'test_user') }
  let(:event) { Event.create(creator: user, date_of_event: Date.current + 2, description: 'event') }
  context 'validates associated models' do
    it 'returns false if does not have :attendee_id and :attended_event_id' do
      expect(ua.valid?).to be false
    end
    it 'returns false if not having attendee or :atendee_id' do
      ua.attendee = user
      expect(ua.valid?).to be false
    end
    it 'returns false if not having attended_event or :atended_event_id' do
      ua.attended_event = event
      expect(ua.valid?).to be false
    end
    it 'returns true if has both attended_event and attendee' do
      ua.attended_event = event
      ua.attendee = user
      expect(ua.valid?).to be true
    end
  end
  context 'relation' do
    it 'attendee should return user' do
      ua.attended_event = event
      ua.attendee = user
      expect(ua.attendee).to eq(user)
    end
    it 'attended_event should return event' do
      ua.attended_event = event
      ua.attendee = user
      expect(ua.attended_event).to eq(event)
    end
  end
end
