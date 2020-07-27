class User < ApplicationRecord
    has_secure_password
    has_many :calendars
    has_many :gigs, through: :calendars
    has_many :invoices

    # t.string "username"
    #t.string "password_digest"
    # t.string "email"
    # t.boolean "admin"
end
