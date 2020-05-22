class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: {
        min: 4,
        max: 20,
    }
end
