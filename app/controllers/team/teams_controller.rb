class Team::TeamsController < ApplicationController
  def index
    @users = current_user.team.users.order(:point)
    attribution_point
  end

  def attribution_point
    @users.each do |user|
      user.chores.each do |chore|
        if chore.status == "done"
          user.point += chore.task.intensity
        end
      end
    end
    @users.order(:point)
  end
end

# Classement
# On attribue des points à chaque user :
