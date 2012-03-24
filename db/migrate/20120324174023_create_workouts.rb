class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :duration
      t.string  :media_url

      t.timestamps
    end
  end
end
