class AngelsController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
        @angel = Angel.new
    end

    def create
        @user = Angel.new(first_name: angel_params[:first_name], last_name: angel_params[:last_name], email: angel_params[:email], password: angel_params[:password])

        if passwords_match? && !Genius.find_by(email: angel_params[:email]) && !Angel.find_by(email: angel_params[:email]) && @user.save
            session[:angel_id] = @user.id
            redirect_to '/pitches'

        elsif !passwords_match?
            flash[:alert] = "Passwords don't match."
            render :new

        else
            flash[:alert] = "Email already exists or some other error."
            render :new
        end
    end

    def show
        @angel = Angel.find(params[:id])
    end

    def index
        @angels = Angel.all
    end

    private

    def angel_params
        params.require(:angel).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def passwords_match?
        angel_params[:password] == angel_params[:password_confirmation]
    end
    
    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this section."
            redirect_to new_session_path
        end
    end
end