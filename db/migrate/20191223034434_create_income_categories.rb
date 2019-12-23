class CreateIncomeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :income_categories do |t|
      t.string :name, null: false, limit: 63
      t.references :parent, foreign_key: { to_table: :income_categories }

      t.timestamps
    end
    add_index :income_categories, :name, unique: true
  end
end
