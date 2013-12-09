class TeamsController < ApplicationController
  def index
  	@teams = Team.all
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
