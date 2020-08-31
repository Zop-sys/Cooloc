class BuildTeamMonthlyPlanningService
  def initialize(team)
    @team = team
  end

  def call
    dispatch_monthly_tasks
    # dispatch_weekly_tasks
  end

  private

  def dispatch_monthly_tasks
    roommate_index = 0
    while monthly_tasks.any?
      roommate = roommates[roommate_index]
      roommate.chores.create(
        task:        monthly_tasks.pop,
        week_number: current_week_number
      )
      roommate_index = roommate_index > roommates.length - 1 ? 0 : roommate_index + 1
    end
  end

  def dispatch_weekly_tasks
  end

  def roommates
    @roommates ||= @team.users.shuffle
  end

  def tasks
    @team.tasks
  end

  def monthly_tasks
    @monthly_tasks ||= tasks.select(&:monthly?)
  end

  def weekly_tasks
    @weekly_tasks ||= tasks.select(&:weekly?)
  end

  def current_week_number
    Date.today.week
  end

  def current_month_last_week_number
    Date.today.month
  end
end

# BuildTeamMonthlyPlanningService.new(Team.find_by(name: "Les coolocs créatifs !")).call
