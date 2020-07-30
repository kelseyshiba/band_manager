class SetList < ApplicationRecord
    belongs_to :gig
    has_many :songs

    validates :songs, :length => { :minimum => 1 }

    def song_attributes=(song_attributes)
        if !song_attributes.empty?
            song = Song.find_or_create_by(title: song_attributes[:title])
            song.artist = song_attributes[:artist]
            song.save 
            self.songs << song
        end
    end
end
