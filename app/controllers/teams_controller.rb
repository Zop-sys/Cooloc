class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_param)

    if @team.save
      current_user.update(team: @team)

      params[:roomate_emails].each do |roomate_email|
        next if roomate_email.blank?

        User.invite!(email: roomate_email, team: @team)
      end
      redirect_to new_team_task_path
    else
      render :new
    end

  end

  private

  def team_param
    params.require(:team).permit(:name)
  end
end
