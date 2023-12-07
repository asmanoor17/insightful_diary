class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :phrase
      t.text :articles
      t.string :dateSearched
      t.references :user, null: false, foreign_key: true
      t.references :journal, null: false, foreign_key: true

      t.timestamps
    end
  end
end

