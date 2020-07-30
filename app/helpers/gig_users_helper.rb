module GigUsersHelper
    def gig_user_id(gig, user)
        GigUser.find_by(gig_id: gig.id, user_id: user.id)
    end

    def gig_user_status(gig_user_id)
        gig_user = GigUser.find_by_id(gig_user_id)
        if gig_user 
            if gig_user.status.downcase == "pending"
                tag.p("Status is #{gig_user.status} please accept or decline") +
                button_to('Accept', gig_user_path(gig_user), data: {confirm: 'Accept this Gig?'}, method: :patch) + tag(:br) +
                button_to('Decline', gig_user_path(gig_user), data: {confirm: 'Decline this Gig?'}, method: :delete)
            elsif gig_user.status.downcase == "accepted"
                tag.p("Gig Accepted!")
            elsif gig_user.status.downcase == "declined"
                tag.p("This gig was declined.")
            end
        end
    end
end
