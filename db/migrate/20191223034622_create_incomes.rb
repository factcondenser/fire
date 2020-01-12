class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.string :description, limit: 255
      t.references :user, null: false, foreign_key: true
      t.references :income_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
