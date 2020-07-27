class GigsController < ApplicationController
    before_action :set_gig, only: [:show]
    before_action :require_login, only: [:show]

    def index
        @gigs = Gig.all
    end

    def show
        
    end

    private

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
