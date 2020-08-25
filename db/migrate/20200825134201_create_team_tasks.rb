class CreateTeamTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :team_tasks do |t|
      t.references :team, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
