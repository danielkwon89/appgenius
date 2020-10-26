class SessionsController < ApplicationController
    def new
        @angel = Angel.new
        @genius = Genius.new
    end

    def create
        if params[:angel]
            @user = Angel.find_by(email: params[:angel][:email])

            if @user && @user.authenticate(params[:angel][:password])
                session[:angel_id] = @user.id
                redirect_to angel_path(@user)

            else
                redirect_to new_session_path, notice: "Incorrect email or password."
            end

        elsif params[:genius]
            @user = Genius.find_by(email: params[:genius][:email])

            if @user && @user.authenticate(params[:genius][:password])
                session[:genius_id] = @user.id
                redirect_to genius_path(@user)

            else
                redirect_to new_session_path, notice: "Incorrect email or password."
            end
            
        else
            redirect_to new_session_path, notice: "Incorrect email or password."
        end
    end

    def create_from_provider
        # If the email doesn't exist, render a page saying that email doesn't exist, and have them choose between creating an Angel or a Genius account then redirect_to the sign up page of choice.
        @angel = Angel.find_by(email: auth[:info][:email])
        @genius = Genius.find_by(email: auth[:info][:email])

        if @angel
            session[:angel_id] = @angel.id
            redirect_to angel_path(@angel)
        elsif @genius
            session[:genius_id] = @genius.id
            redirect_to genius_path(@genius)
        else
            redirect_to new_session_path, notice: "Login with Facebook failed."
        end
    end

    def destroy
        session.clear
        redirect_to new_session_path
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end
