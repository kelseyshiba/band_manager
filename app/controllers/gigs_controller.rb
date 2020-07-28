class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :edit]
    before_action :require_login, only: [:show]
    before_action :if_admin?, only: [:edit]

    def new
        @gig = Gig.new
    end

    def create
        #  "gig"=>{"title"=>"Another Day", "event_type"=>"Wedding", "status"=>"Pending", "client"=>"Craig Basarich", "street_address"=>"4444 Washington Street", "secondary_address"=>"", "city"=>"Greenville", "state"=>"SC", "zip"=>"27253", "start_time"=>"2020-07-27T22:50", "end_time"=>"2020-07-27T23:50", "production_schedule"=>"Hello all", "guest_list"=>"Mom\r\nDad", "user_ids"=>[""], "user_attributes"=>{"name"=>"Zakk Efron", "instrument"=>"Trombone"}}
        @gig = Gig.new(gig_params)
        if @gig.valid?
            redirect_to gig_path(@gig)
        else
            flash[:notice] = "Please create a valid gig"
            render :new
        end
    end

    def index
        @gigs = Gig.all
    end

    def show
        
    end

    def edit

    end

    def update
        @gig = Gig.find_by_id(params[:id])
        @gig.update(gig_params)
        if @gig.save
            redirect_to gig_path(@gig)
        else
            flash[:notice] = "Gig was not updated"
            redirect_to gigs_path
        end        
    end

    private

    def gig_params
        params.require(:gig).permit(:title, :event_type, :status, :client, :street_address, :secondary_address, :city, :state, :zip, :start_time, :end_time, :production_schedule, :guest_list, user_ids:[], user_attributes: [:name, :instrument])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
