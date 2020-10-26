class AngelsController < ApplicationController
    def new
        @angel = Angel.new
    end

    def create
        if angel_params[:password] == angel_params[:password_confirmation] && !Genius.find_by(email: angel_params[:email]) && !Angel.find_by(email: angel_params[:email])
            user = Angel.create(first_name: angel_params[:first_name], last_name: angel_params[:last_name], email: angel_params[:email], password: angel_params[:password])
            
            session[:angel_id] = user.id
            redirect_to '/pitches'
        elsif angel_params[:password] != angel_params[:password_confirmation]
            flash[:alert] = "Passwords don't match."
            render :new

        else
            flash[:alert] = "Email already exists."
            render :new
        end
    end

    def show
        @angel = Angel.find(params[:id])
    end

    private

    def angel_params
        params.require(:angel).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end