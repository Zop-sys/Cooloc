class AddWeekNumberAndMonthNumberToChores < ActiveRecord::Migration[6.0]
  def change
    add_column :chores, :week_number, :integer
    add_column :chores, :month_number, :integer
  end
end
