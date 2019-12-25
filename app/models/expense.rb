class Expense < ApplicationRecord
  belongs_to :expense_category

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }
end
