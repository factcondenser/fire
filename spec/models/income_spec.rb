require 'rails_helper'

RSpec.describe Income, type: :model do
  it { is_expected.to belong_to(:income_category) }
  it { is_expected.to monetize(:amount) }
end
