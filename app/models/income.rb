class Income < ApplicationRecord
  belongs_to :income_category

  monetize :amount_cents, numericality: { greater_than: 0 }
end
