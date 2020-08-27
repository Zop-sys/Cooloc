class TeamTasksController < ApplicationController
  def new
    @team_tasks = TeamTask.new
  end

  def create

  end
end
