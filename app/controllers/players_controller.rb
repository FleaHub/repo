class PlayersController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.create([:params])
    redirect_to teams_path(@team)


  end



def show

end
end
