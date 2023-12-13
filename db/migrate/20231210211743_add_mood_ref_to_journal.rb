class AddMoodRefToJournal < ActiveRecord::Migration[7.1]
  def change
    add_reference :journals, :mood, null: false, foreign_key: true
  end
end
