class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :edit]
    before_action :require_login, only: [:show, :index, :edit]
    before_action :if_admin?, only: [:edit, :new]

    def new
        @gig = Gig.new
    end

    def create
        @gig = Gig.new(gig_params)
        if @gig.save
            redirect_to gig_path(@gig)
        else
            flash[:notice] = "Please create a valid gig"
            render :new
        end
    end

    def index
        if params[:user_id]
            if !User.find_by_id(params[:user_id]).nil?
                @gigs = User.find_by_id(params[:user_id]).gigs.order_by_date
            else
                flash[:notice] = "No gigs listed for this musician."
                redirect_to gigs_path
            end
        else
            @gigs = Gig.all.order_by_date
        end
    end

    def show
        
    end

    def edit

    end

    def update
        #"gig"=>{"title"=>"sedentary", "event_type"=>"rehearsal", "gig_status"=>"pending", "client"=>"Mrs. Goldie Jacobs", "street_address"=>"255 Jackie Ports", "secondary_address"=>"Apt. 496", "city"=>"Lake Katharynland", "state"=>"Missouri", "zip"=>"08189-8070", "start_time"=>"2020-08-03T21:22:32", "end_time"=>"2020-08-04T00:58:32", "production_schedule"=>"", "guest_list"=>"", "user_ids"=>["", "9"], "user_attributes"=>{"name"=>"", "instrument"=>""}}, "commit"=>"Save Gig", "controller"=>"gigs", "action"=>"update", "id"=>"7"}
        @gig = Gig.find_by_id(params[:id])
        @gig.update(gig_params)
        if @gig.save
            redirect_to gig_path(@gig)
        else
            flash[:notice] = "Gig was not updated"
            redirect_to gigs_path
        end        
    end

    def destroy
        gig = Gig.find_by_id(params[:id]).destroy
        flash[:notice] = "Gig deleted."
        redirect_to gigs_path
    end

    private

    def gig_params
        params.require(:gig).permit(:title, :event_type, :gig_status, :client, :street_address, :secondary_address, :city, :state, :zip, :start_time, :end_time, :production_schedule, :guest_list, user_ids:[], user_attributes: [:name, :instrument])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
