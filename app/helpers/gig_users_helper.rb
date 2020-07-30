module GigUsersHelper
    def gig_user_id(gig, user)
        GigUser.find_by(gig_id: gig.id, user_id: user.id)
    end
end
