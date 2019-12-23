class Expense < ApplicationRecord
  belongs_to :expense_category

  monetize :amount_cents, numericality: { greater_than: 0 }
end
