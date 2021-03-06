class SetList < ApplicationRecord
    belongs_to :gig
    has_many :setlist_songs
    has_many :songs, through: :setlist_songs

    validates :songs, :length => { :minimum => 1 }

    def song_attributes=(song_attributes)
        if song_attributes[:title].present? && song_attributes[:artist].present?
            song = Song.find_or_create_by(title: song_attributes[:title]) do |song|
                song.artist = song_attributes[:artist]
                song.save
                self.songs << song
            end
        end
    end

end
