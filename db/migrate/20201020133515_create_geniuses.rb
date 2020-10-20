class CreateGeniuses < ActiveRecord::Migration[6.0]
  def change
    create_table :geniuses do |t|

      t.timestamps
    end
  end
end
