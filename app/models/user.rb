class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :name, presence: true
    validates :instrument, presence: true
        
    has_many :gig_users
    has_many :gigs, through: :gig_users
    has_many :invoices


    # t.string "username" #t.string "password_digest" # t.string "email"  # t.boolean "admin"

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u| 
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
