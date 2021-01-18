class UserController < ActionController::Base
    def new
        @user = User.new
        @which_path = "/"
    end

    def create
        user = User.new(user_params)
        redirect_to new_user_path
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end