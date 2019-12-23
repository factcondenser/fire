require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { is_expected.to belong_to(:expense_category) }
  it { is_expected.to monetize(:amount) }
end
