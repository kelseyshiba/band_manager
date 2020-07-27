class Gig < ApplicationRecord
    belongs_to :calendar
    has_many :set_lists

    def full_location
        "#{self.street_address}"\
        "#{self.secondary_address}" \
        "#{self.city}, #{self.state} #{self.zip}"
    end

    def formatted_start_time
        self.start_time.strftime("%B %d, %Y, %I:%M%P") 
    end

    def formatted_end_time
        self.end_time.strftime("%B %d, %Y, %I:%M%P")
    end
end
