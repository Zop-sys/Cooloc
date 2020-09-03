class ChoresController < ApplicationController
  def index
    @chores                       = current_user.chores
                                                .for_planning.includes(:task)
                                                .order(:created_at)
    @monthly_chores               = @chores.where(tasks: { frequency: 'monthly' })
    @weekly_chores_by_week_number = @chores.where(tasks: { frequency: 'weekly' })
                                           .order(:week_number, :id, :created_at)
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
