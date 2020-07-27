class User < ApplicationRecord
    has_secure_password
    has_many :calendars
    has_many :gigs, through: :calendars
    has_many :invoices

    # t.string "username" #t.string "password_digest" # t.string "email"  # t.boolean "admin"

    def self.from_omniauth(response)
        # byebug
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u| 
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
