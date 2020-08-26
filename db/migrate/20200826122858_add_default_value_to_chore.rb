class AddDefaultValueToChore < ActiveRecord::Migration[6.0]
  def change
    change_column :chores, :done, :string, :default => "A faire"
  end
end
