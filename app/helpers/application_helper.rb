module ApplicationHelper

    def logged_in?
        !!session[:genius_id] || !!session[:angel_id]
    end

    def current_user
    end

    # def logout
    # end

end
