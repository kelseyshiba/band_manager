class GigUsersController < ApplicationController
    def update
        # <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"4xjFJGqSvHxNYW5sEVA0cE4iFSKYL5L6D7RCln4wPiSXkpB0k1U3IKLnaT0quL5FyzQy8xHQZYtImeUFa/O8NA==", "controller"=>"gig_users", "action"=>"update", "id"=>"5"} permitted: false>
        @gig_user = GigUser.find_by_id(params[:id])
        @gig_user.status == "Accepted"
        if @gig_user.save
            render :'gigs/index'
        else
            flash[:notice] = "Submission not accepted."
            redirect_to user_gigs_path
        end
    end

    def destroy

    end
end
