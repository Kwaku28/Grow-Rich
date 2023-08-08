class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.references :budget, null: false, foreign_key: true, index: true
      t.references :expense, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
