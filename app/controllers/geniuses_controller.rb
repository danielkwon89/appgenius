class GeniusesController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
        @genius = Genius.new
    end

    def create
        if passwords_match? && !Genius.find_by(email: genius_params[:email]) && !Angel.find_by(email: genius_params[:email])
            user = Genius.create(first_name: genius_params[:first_name], last_name: genius_params[:last_name], email: genius_params[:email], password: genius_params[:password])

            session[:genius_id] = user.id
            redirect_to '/pitches'

        elsif !passwords_match?
            flash[:alert] = "Passwords don't match."
            render :new

        else
            flash[:alert] = "Email already exists."
            render :new
        end
    end

    def show
        @genius = Genius.find(params[:id])
    end

    private

    def genius_params
        params.require(:genius).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def passwords_match?
        genius_params[:password] == genius_params[:password_confirmation]
    end

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this section."
            redirect_to new_session_path
        end
    end
end
