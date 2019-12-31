# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  it { is_expected.to validate_length_of(:password).is_at_most(128) }
end
