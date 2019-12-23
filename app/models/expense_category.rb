class ExpenseCategory < ApplicationRecord
  belongs_to :parent, class_name: 'ExpenseCategory', optional: true
  has_many :subcategories, class_name: 'ExpenseCategory', foreign_key: :parent_id, inverse_of: :parent,
                           dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: true
end
