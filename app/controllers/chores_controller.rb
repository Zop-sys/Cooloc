class ChoresController < ApplicationController
  def index
    @chores                       = current_user.chores.includes(:task)
    @monthly_chores               = @chores.where(tasks: { frequency: 'monthly' })
    @weekly_chores                = @chores.where(tasks: { frequency: 'weekly' })
    @weekly_chores_by_week_number = @chores.where(tasks: { frequency: 'weekly' })
                                           .group_by(&:week_number)

  end

  def change_status_done
    @chore = Chore.find(params[:id])
    @chore.status = "done"
    @chore.save
    redirect_to chores_path
  end

  def change_status_uncomplete
    @chore = Chore.find(params[:id])
    @chore.status = "uncomplete"
    @chore.save
    redirect_to chores_path
  end

  def change_status_pending
    @chore = Chore.find(params[:id])
    @chore.status = "pending"
    @chore.save
    redirect_to chores_path
  end
end
