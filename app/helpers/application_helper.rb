module ApplicationHelper
    def isLoggedIn?
        return true if session[:user_id] != nil
        return false
    end

    def current_user_id
        session[:user_id]
    end

    def current_user
        if isLoggedIn?
            return User.find(session[:user_id])
        else
            return nil
        end
    end

end
