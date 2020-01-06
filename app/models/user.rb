# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :auth_token

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :confirmable, :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, :validatable
end
