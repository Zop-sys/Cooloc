class BuildTeamMonthlyPlanningService
  def initialize(team)
    @team = team
  end

  def call
    dispatch_monthly_tasks
    dispatch_weekly_tasks
  end

  private

  def dispatch_monthly_tasks
    roommate_index = 0
    while monthly_tasks.any?
      roommate = roommates[roommate_index]
      if can_add_chore_to_user?(roommate)
        chore = roommate.chores.create(
          task:         monthly_tasks.pop,
          month_number: current_month_number
        )
        total_intensity_by_user_id[roommate.id] += chore.task.intensity
      end
      roommate_index = roommate_index == roommates.length - 1 ? 0 : roommate_index + 1
    end
  end

  def dispatch_weekly_tasks
    roommate_index       = 0
    should_dispatch_task = true
    week_number          = first_day_of_month.cweek
    next_week_day        = first_day_of_month.next_week
    while should_dispatch_task
      weekly_tasks = tasks.select(&:weekly?)
      while weekly_tasks.any?
        roommate = roommates[roommate_index]
        if can_add_chore_to_user?(roommate)
          chore = roommate.chores.create(
            task:         weekly_tasks.pop,
            week_number:  week_number
          )
          total_intensity_by_user_id[roommate.id] += chore.task.intensity
        end
        roommate_index = roommate_index == roommates.length - 1 ? 0 : roommate_index + 1
      end
      next_week_day = next_week_day.next_week
      week_number = next_week_day.cweek
      should_dispatch_task = next_week_day.month == current_month_number
    end
  end

  def total_intensity_by_user_id
    @total_intensity_by_user_id ||= Hash.new(0)
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

  def first_day_of_month
    Date.new(Date.today.year, current_month_number, 1)
  end

  def current_month_number
    Date.today.month
  end

  def current_month_last_week_number
    Date.today.month
  end

  def max_total_intensity
    monthy_sum = monthly_tasks.sum(&:intensity)
    weekly_sum = tasks.select(&:weekly?).sum(&:intensity) * 4
    (monthy_sum + weekly_sum) / roommates.size
  end

  def all_roommates_reached_max_intensity?
    total_intensity_by_user_id.all? do |_user_id, total_intensity|
      total_intensity >= max_total_intensity
    end
  end

  def can_add_chore_to_user?(roommate)
    return true if all_roommates_reached_max_intensity?

    total_intensity_by_user_id[roommate.id] < max_total_intensity
  end
end

# result = BuildTeamMonthlyPlanningService.new(Team.find_by(name: "Les coolocs créatifs !")).call
