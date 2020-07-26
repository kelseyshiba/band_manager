class Gig < ApplicationRecord
    belongs_to :calendar
    has_many :set_lists
end
