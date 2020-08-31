class RenameChoresDoneAndChangeDefault < ActiveRecord::Migration[6.0]
  def change
    rename_column :chores, :done, :status
    change_column_default :chores, :status, 'pending'
  end
end
