# frozen_string_literal: true

class Income < ApplicationRecord
  before_validation :assign_uncategorized

  belongs_to :user
  belongs_to :income_category

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }

  private

  def assign_uncategorized
    return if income_category_id.present?

    self.income_category_id = IncomeCategory.where(name: 'Uncategorized').pick(:id)
  end
end
