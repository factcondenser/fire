class CreateExpenseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_categories do |t|
      t.string :name, null: false, limit: 63
      t.references :parent, foreign_key: { to_table: :expense_categories }

      t.timestamps
    end
    add_index :expense_categories, :name, unique: true
  end
end
