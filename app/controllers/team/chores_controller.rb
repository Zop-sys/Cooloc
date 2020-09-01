class Team
  class ChoresController < ApplicationController
    def index
      @team                               = current_user.team
      # @chores                           = team.users.chores.includes(:task)
      @user_chores                        = all_user(@team)
      @monthly_chores_users               = users_monthly_chores(@user_chores)
      @weekly_chores_by_week_number_users = users_weekly_chores_by_week_number(@user_chores)
    end

    def all_user(team)
      @chores = []
      team.users.each do |user|
        @chores << user.chores.includes(:task)
      end
      return @chores
    end

    def group_user_by_week(chores_user)
      # d'instinct je ferais un super fat if qui mettrais tous les week number ensemble puis mes integrerais dans un super hash mais je suis pas hyper confiante
    end

    def users_monthly_chores(user_chores)
      @monthly_chores = []
      user_chores.each do |user_chore|
        @monthly_chores << user_chore.where(tasks: { frequency: 'monthly' })
      end
      return @monthly_chores
    end

    def users_weekly_chores_by_week_number(user_chores)
      @weekly_chores_users = []
      user_chores.each do |user_chore|
        user_chore.where(tasks: { frequency: 'weekly' }).group_by(&:week_number)
      end
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
