class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base
  
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, "this is cool")
    end
  
    def self.decode(token)
      puts token
      body = JWT.decode(token, "this is cool")[0]
      puts body
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end
end
