class CreateGroupExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :group_expenses do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
