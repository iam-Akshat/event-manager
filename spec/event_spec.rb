require "rails_helper"

RSpec.describe Event do
    let (:user) {User.create(username:"akshat")}
    let (:ev){Event.new(creator:user)}
    context "make sure event is related to a creator" do
        it "returns false when event does not have an assosciated creator or creator_id" do
            e = Event.new
            e.description ="asdsadsa"
            e.date_of_event = Date.current
            expect(e.valid?).to be false
        end
        it "returns true when event has an assosciated creator or creator_id" do
            e = Event.new
            e.creator = user
            e.description ="asdsadsa"
            e.date_of_event = Date.current
            expect(e.valid?).to be true
        end
    end
    context "validates presence of required fields" do
        it "returns false when event desription is not present" do
            ev.date_of_event = Date.current 
            expect(ev.valid?).to be false
        end
        it "returns true when event desription is present" do
            ev.date_of_event = Date.current 
            ev.description = "sadkdqj"
            expect(ev.valid?).to be true
        end
        it "returns false when event date is not present" do
            ev.description = "suppppppp" 
            expect(ev.valid?).to be false
        end
        it "returns true when event date is present" do
            ev.description = "suppppppp"
            ev.date_of_event = Date.current 
            expect(ev.valid?).to be true
        end

        
    end
end