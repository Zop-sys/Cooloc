class TeamTasksController < ApplicationController
  def new
    @team_task = TeamTask.new
    @tasks = Task.all
  end

  def create
    @team = current_user.team
    if @team.update(task_ids: team_params[:task_id])
      BuildTeamMonthlyPlanningService.new(@team).call
      redirect_to chores_path, notice: 'Tes tâches sont bien enregistrées ! '
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team_task).permit(task_id: [])
  end
end
