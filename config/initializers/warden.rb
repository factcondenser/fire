# frozen_string_literal: true

require "token_authenticatable"

Warden::Strategies.add(:token_authenticatable, TokenAuthenticatable)
