class Team::TeamsController < ApplicationController
  def index
    @users = current_user.team.users.all
    @classement = @users.order(point: :desc)
    attribution_point
  end

  def attribution_point
    @users.each do |user|
      user.point = 0
      user.chores.each do |chore|
        if chore.status == "done"
          user.point += chore.task.intensity
        end
      end
      user.save
    end
    # @users.order(:point)
  end
end
