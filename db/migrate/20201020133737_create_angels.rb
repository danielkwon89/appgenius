class CreateAngels < ActiveRecord::Migration[6.0]
  def change
    create_table :angels do |t|

      t.timestamps
    end
  end
end
