class CreateJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :journals do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
