class SetListsController < ApplicationController
    def index
        @gig = Gig.find_by_id(params[:gig_id])
        @set_lists = @gig.set_lists
    end
end
