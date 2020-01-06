# frozen_string_literal: true

class TokenAuthenticatable < Warden::Strategies::Base
  def valid?
    binding.pry
    auth_token.present? && user_email.present?
  end

  def authenticate!
    # Look up user by known key (email) and do safe compare to mitigate timing attacks.
    user = User.find_by(email: user_email)

    if user && ActiveSupport::SecurityUtils.fixed_length_secure_compare(user.auth_token, auth_token)
      success!(user)
    else
      fail!('Invalid access token')
    end
  end

  private

  def auth_token
    env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
  end

  def user_email
    env['HTTP_USER_EMAIL'].to_s
  end
end
