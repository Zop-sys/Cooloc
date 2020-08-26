class AddDefaultValueToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :team, :reference, :default => nil
  end
end
