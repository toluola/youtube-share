class User < ApplicationRecord
    has_secure_password
    has_many :videos
    validates_presence_of :username, :password_digest
    validates :username, uniqueness: true
end
