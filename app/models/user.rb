class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { message: "The username %{value} has already been taken" },
                         format: { without: /\s/,
                                   message: "Your username should have no spaces" }
    validates :username, :password_digest, presence: { message: "%{value}should be present" }
end
