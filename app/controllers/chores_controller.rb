class ChoresController < ApplicationController
  def index
    @chores                       = current_user.chores.includes(:task)
    @monthly_chores               = @chores.where(tasks: { frequency: 'monthly' })
    @weekly_chores_by_week_number = @chores.where(tasks: { frequency: 'weekly' })
                                           .group_by(&:week_number)
  end
end
