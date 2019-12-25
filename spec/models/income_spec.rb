require 'rails_helper'

RSpec.describe Income, type: :model do
  it { is_expected.to belong_to(:income_category) }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }
end
