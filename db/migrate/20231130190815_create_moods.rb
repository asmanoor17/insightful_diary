class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :phrase
      t.text :articles
      t.string :dateSearched
      t.references :users, null: false, foreign_key: true
      t.references :journals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
