class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.integer :pitch_id
      t.integer :angel_id
      t.float :investment_amount

      t.timestamps
    end
  end
end
