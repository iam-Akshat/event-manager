class EventController < ActionController::Base
    def new
        @event = Event.new
        @which_path = user_event_index_path
    end
    def create
        user = User.find(params[:user_id])
        event = user.events.new(event_params)
        begin
            event.save!
        rescue => exception
            puts exception
            redirect_to new_user_event_path
        else
            redirect_to user_path(user)
        end
    end

    def show
        @event = Event.joins("INNER JOIN users ON users.id = events.creator_id").where("events.id = :event_id ",{event_id: params[:id]}).select("users.username,events.*").take
    end

    def index
        @events = Event.all
    end

    private
    def event_params
        params.require(:event).permit(:description,:date_of_event)
    end
end
