# frozen_string_literal: true

require "rails_helper"

RSpec.describe IncomeCategory, type: :model do
  subject { create(:income_category, :with_parent) }

  it { is_expected.to belong_to(:parent).class_name("IncomeCategory").optional }

  it do
    is_expected.to have_many(:subcategories).class_name("IncomeCategory")
                                            .with_foreign_key(:parent_id)
                                            .inverse_of(:parent)
                                            .dependent(:destroy)
  end

  it { is_expected.to have_many(:incomes).dependent(:destroy) }
  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:parent_id) }
end
