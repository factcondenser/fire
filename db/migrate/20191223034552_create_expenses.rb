class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.references :expense_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
