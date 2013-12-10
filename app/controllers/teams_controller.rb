class TeamsController < ApplicationController
  # choose a team
  def index
  	@teams = Team.all
  end

  # main page for game
  def show
    respond_to do |format|
      format.html
      format.json { render json: @team_progress }
    end
  end

  def new
  end

  def create
  	@team = Team.new(team_params)
  	@team.save
  	redirect_to :back
  end

  private
  def team_params
  	params.require(:team).permit(:name)
  end
end
