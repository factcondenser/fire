require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  subject { create(:expense_category) }

  it { is_expected.to belong_to(:parent).class_name('ExpenseCategory').optional }
  it do
    is_expected.to have_many(:subcategories).class_name('ExpenseCategory')
                                            .with_foreign_key(:parent_id)
                                            .inverse_of(:parent)
                                            .dependent(:destroy)
  end
  it { is_expected.to have_many(:expenses).dependent(:destroy) }

  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
