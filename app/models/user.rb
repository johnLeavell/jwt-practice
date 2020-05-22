class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: {
        min: 7,
        mad: 20,
    }
end
