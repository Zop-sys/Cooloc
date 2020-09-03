class ChoresController < ApplicationController
  before_action :set_chore, only: [:change_status_done, :change_status_uncomplete, :change_status_pending]

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
    @chore.update(status: "done")
    redirect_to_chores_list
  end

  def change_status_uncomplete
    @chore.update(status: "uncomplete")
    redirect_to_chores_list
  end

  def change_status_pending
    @chore.update(status: "pending")
    redirect_to_chores_list
  end

  private

  def set_chore
    @chore = Chore.find(params[:id])
  end

  def redirect_to_chores_list
    redirect_to params[:list] == 'team' ? team_chores_path : chores_path
  end
end
