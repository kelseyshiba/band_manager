class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :edit]
    before_action :require_login, only: [:show]
    before_action :if_admin?, only: [:edit]


    def index
        @gigs = Gig.all
    end

    def show
        
    end

    def edit

    end

    private

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
