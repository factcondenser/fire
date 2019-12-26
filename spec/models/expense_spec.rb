# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { is_expected.to belong_to(:expense_category) }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }
end
