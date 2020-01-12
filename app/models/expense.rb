# frozen_string_literal: true

class Expense < ApplicationRecord
  before_validation :assign_uncategorized

  belongs_to :user
  belongs_to :expense_category

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }

  private

  def assign_uncategorized
    return if expense_category_id.present?

    self.expense_category_id = ExpenseCategory.where(name: 'Uncategorized').pick(:id)
  end
end
