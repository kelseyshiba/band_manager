class SetList < ApplicationRecord
    belongs_to :gig
    has_many :songs
end
