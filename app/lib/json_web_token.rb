# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.SECRET_KEY_BASE

  def self.encode(payload)
    puts HMAC_SECRET
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end