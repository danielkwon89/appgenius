module ApplicationHelper
    def logged_in?
        !!session[:genius_id] || !!session[:angel_id]
    end

    def current_user
        if session[:genius_id] 
            session[:genius_id]
        else
            session[:angel_id]
        end
    end
end
