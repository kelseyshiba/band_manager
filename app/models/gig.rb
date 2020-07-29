class Gig < ApplicationRecord
    has_many :set_lists
    has_many :gig_users
    has_many :users, through: :gig_users

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
        if user_attributes[:name].present? && user_attributes[:instrument].present?
            user = User.find_or_create_by(name: user_attributes[:name]) do |u|
                u.instrument = user_attributes[:instrument]
                u.email = "kelsey.shiba@gmail.com" ##FIX THIS
                u.password = SecureRandom.hex(16) #make a sample pass, expires if they haven't signed up
                #has_secure_password - reset password 
                u.username = user_attributes[:name].gsub(" ", ".").downcase
                u.save
                self.users << u
            end
        end
    end

    def self.order_by_date
        order(start_time: :asc)
        #make sure you can write as scope
    end

end
