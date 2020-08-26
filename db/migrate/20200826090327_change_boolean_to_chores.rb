class ChangeBooleanToChores < ActiveRecord::Migration[6.0]
  def change
    change_column :chores, :done, :string
  end
end
