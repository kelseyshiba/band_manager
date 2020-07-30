class Song < ApplicationRecord
    belongs_to :set_list

    #validates :title, :artist, presence: true
end
