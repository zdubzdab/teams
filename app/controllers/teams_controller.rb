class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :description)
    end

end
