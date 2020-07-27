class Gig < ApplicationRecord
    belongs_to :calendar
    has_many :set_lists

    def full_location
        return 'No Address Available' if self.street_address.blank?
        parts = [self.street_address, self.secondary_address, self.city, self.state, self.zip]
        parts.reject!(&:blank?)
        parts.join('<br/>').html_safe

        # "#{self.street_address}"\
        # "#{self.secondary_address}"\
        # "#{self.city}, #{self.state} #{self.zip}"
    end

    def formatted_start_time
        self.start_time.strftime("%B %d, %Y, %I:%M%P") 
    end

    def formatted_end_time
        self.end_time.strftime("%B %d, %Y, %I:%M%P")
    end

    def formatted_date_title
        self.start_time.strftime("%B %d, %Y")
    end
end
