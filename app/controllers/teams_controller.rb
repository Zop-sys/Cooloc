class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Painting.new(team_params)

      #attendre Mélanie pour l'envoie de mail

    if @team.save
      redirect_to @new_team_task, notice: 'Ta coloc a bien été crée ! '
    else
      render :new
    end
  end

  private

  def team_param
    params.require(:team).permit(:name)
  end
end
