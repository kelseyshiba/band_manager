class Gig < ApplicationRecord
    has_many :set_lists
    has_many :gigs_users
    has_many :users, through: :gigs_users

    def full_location
        return 'No Address Available' if self.street_address.blank?
        parts = [self.street_address, self.secondary_address, self.city, self.state, self.zip]
        parts.reject!(&:blank?)
        parts.join('<br/>').html_safe
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

    def user_attributes=(user_attributes)
            user = User.find_or_create_by(name: user_attributes[:name])
            user.instrument = user_attributes[:instrument]
            user.email = "kelsey.shiba@gmail.com"
            user.password = SecureRandom.hex(16)
            user.username = user_attributes[:name].gsub(" ", ".").downcase
            user.save
            self.users << user
    end

end
