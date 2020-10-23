class InvestmentsController < ApplicationController
    def new
        @investment = Investment.new
    end

    def create
        Investment.create(investment_amount: investment_params[:investment_amount].to_f, pitch_id: investment_params[:pitch_id], angel_id: session[:angel_id])

        pitch = Pitch.find(investment_params[:pitch_id])
        pitch.total_funding += investment_params[:investment_amount].to_f
        pitch.save

        redirect_to pitch_path(investment_params[:pitch_id])
    end

    private

    def investment_params
        params.require(:investment).permit(:investment_amount, :pitch_id)
    end
end
