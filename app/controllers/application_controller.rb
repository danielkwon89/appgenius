class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:genius_id] || !!session[:angel_id]
    end
end
