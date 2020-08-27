class TeamTasksController < ApplicationController
  def new
    @team_task = TeamTask.new
  end

  def create
    @team_task = TeamTask.new
    @team_task.team = Current_user.team
    if @team_task.save
      redirect_to @team_chores, notice: 'Tes tâches sont bien enregistrées ! '
    else
      render :new
    end
  end
end
