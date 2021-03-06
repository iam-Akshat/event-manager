class UserattendanceController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if event.creator_id == session[:user_id]
      invited_user = User.find_by(username: params[:username])
      if invited_user.nil?
        flash[:error] = 'User not found'
      else
        flash[:notice] = 'Invited'
        begin
          UserAttendance.create!(attendee: invited_user, attended_event: event)
          flash[:notice] = 'Invited'
        rescue StandardError => e
          puts e
          flash[:error] = 'Internal Error'
        end
      end
      redirect_to event_path(event)
    else
      flash[:error] = 'You are not authorized to do that'
      redirect_to user_path(session[:user_id])
    end
  end
end
