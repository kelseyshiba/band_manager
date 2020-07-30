class GigUsersController < ApplicationController
    def update
        @gig_user = GigUser.find_by_id(params[:id])
        @gig_user.status = "Accepted"
        if @gig_user.save
           redirect_to user_gigs_path(current_user)
        else
            flash[:notice] = "Submission not accepted."
            redirect_to user_gigs_path(current_user)
        end
    end

    def destroy
        @gig_user = GigUser.find_by_id(params[:id]).destroy
        flash[:notice] = "Gig has been removed from your gigs"
        redirect_to user_gigs_path(current_user)
    end
end
