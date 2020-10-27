class InvestmentsController < ApplicationController
    before_action :require_login

    def new
        @investment = Investment.new
    end

    def create
        if session[:angel_id]
            investment = Investment.new(investment_amount: investment_params[:investment_amount].to_f, pitch_id: investment_params[:pitch_id], angel_id: session[:angel_id])
            if investment.save
                pitch = Pitch.find(investment_params[:pitch_id])
                pitch.total_funding += investment_params[:investment_amount].to_f
                pitch.save
                redirect_to pitch_path(investment_params[:pitch_id])
            else
                flash[:alert] = "Investment could not be created. Please try logging out and logging back in if this issue persists."
                render :new
            end
        else
            flash[:alert] = "Only Angels can invest!"
            render :new
        end
    end

    def show
        @investment = Investment.find(params[:id])
    end

    private

    def investment_params
        params.require(:investment).permit(:investment_amount, :pitch_id)
    end

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this section."
            redirect_to new_session_path
        end
    end
end
