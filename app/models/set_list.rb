class SetList < ApplicationRecord
    belongs_to :gig
    has_many :songs

    #validates :songs, :length => { :minimum => 1 }

    # def song_ids=(song_ids)
    #     song_ids.each do |song_id|
    #         if !song_id.empty? && !Song.find_by_id(song_id).nil? 
    #             song = Song.find_by_id(song_id) 
    #             self.songs << song 
    #         end
    #     end
    # end
    #validate

    def song_attributes=(song_attributes)
        if !song_attributes.empty?
            song = Song.find_or_create_by(title: song_attributes[:title])
            song.artist = song_attributes[:artist]
            song.save 
            self.songs << song
        end
    end
end
