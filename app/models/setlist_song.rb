class SetlistSong < ApplicationRecord
    belongs_to :song 
    belongs_to :set_list
end
