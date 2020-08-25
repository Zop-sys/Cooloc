class AddPseudoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pseudo, :string
    add_reference :users, :team, foreign_key: true
  end
end
