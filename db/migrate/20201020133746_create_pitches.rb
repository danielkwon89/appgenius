class CreatePitches < ActiveRecord::Migration[6.0]
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :description

      t.datetime :funding_start_date
      t.datetime :funding_end_date

      t.float :total_funding
      t.float :funding_goal

      t.string :category
      t.integer :genius_id

      t.timestamps
    end
  end
end
