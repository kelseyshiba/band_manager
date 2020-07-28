module GigsHelper
    def gig_link_header(current_user)
        if params[:user_id]
            link_to 'Back to All Gigs', gigs_path
        else
            link_to 'See All Your Gigs', user_gigs_path(current_user)
        end
    end

    def gig_list_header(current_user)
        if params[:user_id]
            tag.h2("Gig List for #{current_user.name}")
        else
            tag.h2("Gig List")
        end
    end
end
