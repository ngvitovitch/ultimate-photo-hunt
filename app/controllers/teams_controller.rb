class TeamsController < ApplicationController
  # choose a team
  def index
  	@teams = Team.all
  end

  # main page for game
  def show
    @team = Team.find_by_id(params['id'])
    @game_state = @team.game_state
    @game = Game.find_by_id(@game_state.game_id)
  end

  def map
    @team = Team.find_by_id(params['team_id'])
    @game_state = @team.game_state
    @game = Game.find_by_id(@game_state.game_id)
    @zone = @game.target_zones.find(params['id'])
  end

  def new
    @games = Game.all
    end
  def create
    team = Team.new(:name => params['team']['name'])
    team.build_game_state(:game_id => params['team']['game_id'])
    team.save
    redirect_to :back
  end

#  private
#  def team_params
#  	params.require(:team).permit(:name, :game_id)
#  end
end
