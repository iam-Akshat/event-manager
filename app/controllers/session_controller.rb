class SessionController < ActionController::Base
  def new
    @user = User.new
    @which_path = login_path
  end

  def create
    user = User.find_by(username: login_params[:username])
    if user.nil?
      redirect_to 'new'
    else
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    end
  end

  private

  def login_params
    params.require(:user).permit(:username)
  end
end
