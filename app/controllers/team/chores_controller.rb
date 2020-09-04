class Team
  class ChoresController < ApplicationController
    def index
      @team                               = current_user.team
      @team_chores                        = Chore.for_planning
                                                 .includes(:user, :task)
                                                 .where(users: { team: @team })
                                                 .order(:created_at)
      @team_monthly_chores                = @team_chores.where(tasks: { frequency: 'monthly' }).order(:id)
      @team_weekly_chores_by_week_number  = @team_chores.where(tasks: { frequency: 'weekly' })
                                                        .order(:week_number, :id)
                                                        .group_by(&:week_number)
    end
  end
end
