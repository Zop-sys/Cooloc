class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :intensity
      t.string :room
      t.string :frequency

      t.timestamps
    end
  end
end
