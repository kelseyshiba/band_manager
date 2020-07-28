module GigsHelper
    def gig_link_header(current_user)
        if params[:user_id]
            link_to 'Back to All Gigs', gigs_path
        else
            link_to 'See All Your Gigs', user_gigs_path(current_user)
        end
    end
end
