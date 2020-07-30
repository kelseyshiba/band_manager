class Song < ApplicationRecord
    has_many :setlist_songs
    has_many :set_lists, through: :setlist_songs
    #validates :title, :artist, presence: true
end
