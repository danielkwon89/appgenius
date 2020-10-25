class PitchesController < ApplicationController
    def index
        if params[:genius_id]
            @pitches = Genius.find(params[:genius_id]).pitches
        else
            @pitches = Pitch.all
        end
    end

    def fully_funded
        @pitches = Pitch.fully_funded
    end

    def show
        @pitch = Pitch.find(params[:id])
    end

    def new
        @pitch = Pitch.new(genius_id: params[:genius_id])
    end

    def create
        # binding.pry
        Pitch.create(title: pitch_params[:title], description: pitch_params[:description], category: pitch_params[:category], funding_start_date: pitch_params[:funding_start_date].to_datetime, funding_end_date: pitch_params[:funding_end_date].to_datetime, total_funding: pitch_params[:total_funding].to_f, funding_goal: pitch_params[:funding_goal].to_f, genius_id: session[:genius_id])
        
        redirect_to pitches_path
    end

    private

    def pitch_params
        params.require(:pitch).permit(:title, :description, :category, :funding_start_date, :funding_end_date, :total_funding, :funding_goal, :author_id)
    end
end
