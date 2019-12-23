class IncomeCategory < ApplicationRecord
  belongs_to :parent, class_name: 'IncomeCategory', optional: true
  has_many :subcategories, class_name: 'IncomeCategory', foreign_key: :parent_id, inverse_of: :parent,
                           dependent: :destroy
  has_many :incomes, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: true
end
