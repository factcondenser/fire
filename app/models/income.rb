# frozen_string_literal: true

class Income < ApplicationRecord
  belongs_to :income_category

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }
end
