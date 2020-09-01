class BuildTeamMonthlyPlanningService
  def initialize(team, month_first_day = Date.today.at_beginning_of_month)
    @team                 = team
    @month_first_day      = month_first_day
    @intensity_by_user_id = Hash.new(0)
    @monthly_tasks        = @team.tasks.select(&:monthly?)
    @weekly_tasks         = @team.tasks.select(&:weekly?)
    @roommates            = @team.users.shuffle.cycle
    @chores_to_create     = []
  end
​
  def call
    dispatch_monthly_tasks
    dispatch_weekly_tasks
    Chore.insert_all(@chores_to_create)
  end
​
  private
​
  def dispatch_monthly_tasks
    monthly_tasks = @monthly_tasks.dup.shuffle
    dispatch_task(monthly_tasks.pop) while monthly_tasks.any?
  end
​
  def dispatch_weekly_tasks
    @roommates.rewind
    week_numbers.each do |week_number|
      weekly_tasks = @weekly_tasks.dup.shuffle
      dispatch_task(weekly_tasks.pop, week_number) while weekly_tasks.any?
    end
  end
​
  def dispatch_task(task, week_number = nil)
    roommate = @roommates.next
    assign_task_to_user(roommate, task, week_number) if can_add_chore_to_user?(roommate)
  end
​
  def assign_task_to_user(roommate, task, week_number = nil)
    @chores_to_create << {
      task_id:     task.id,
      user_id:     roommate.id,
      week_number: week_number
    }.merge(default_columns)
​
    @intensity_by_user_id[roommate.id] += task.intensity
  end
​
  def can_add_chore_to_user?(roommate)
    return true if all_roommates_reached_max_intensity?
​
    @intensity_by_user_id[roommate.id] < max_total_intensity
  end
​
  def max_total_intensity
    @max_total_intensity ||= (
      @monthly_tasks.sum(&:intensity) + @weekly_tasks.sum(&:intensity) * 4
    ) / @team.users.size
  end
​
  def all_roommates_reached_max_intensity?
    @intensity_by_user_id.all? do |_user_id, total_intensity|
      total_intensity >= max_total_intensity
    end
  end
​
  def week_numbers
    @month_first_day.cweek..@month_first_day.next_month.cweek - 1
  end
​
  def default_columns
    @default_columns ||= { created_at: tmp = DateTime.now, updated_at: tmp, month_number: @month_first_day.month }
  end
end

# result = BuildTeamMonthlyPlanningService.new(Team.find_by(name: "Les coolocs créatifs !")).call
