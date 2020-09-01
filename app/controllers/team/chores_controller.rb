class Team
  class ChoresController < ApplicationController
    def index
      @team                               = current_user.team
      @team_chores                        = Chore.for_planning
                                                 .includes(:user, :task)
                                                 .where(users: { team: @team })
      @team_monthly_chores                = @team_chores.where(tasks: { frequency: 'monthly' })
      @team_weekly_chores_by_week_number  = @team_chores.where(tasks: { frequency: 'weekly' })
                                                        .group_by(&:week_number)
    end

    def change_status_done
      @chore = Chore.find(params[:id])
      @chore.status = "done"
      @chore.save
      redirect_to team_chores_path
    end

    def change_status_uncomplete
      @chore = Chore.find(params[:id])
      @chore.status = "uncomplete"
      @chore.save
      redirect_to team_chores_path
    end

    def change_status_pending
      @chore = Chore.find(params[:id])
      @chore.status = "pending"
      @chore.save
      redirect_to team_chores_path
    end
  end
end
