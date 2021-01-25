class UserController < ApplicationController
  def new
    @user = User.new
    @which_path = user_index_path
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to sign_in_path
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
