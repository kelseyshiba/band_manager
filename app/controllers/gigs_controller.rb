class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :edit]
    before_action :authorized, only: [:show, :index, :edit, :new]
    before_action :if_admin?, only: [:edit, :new]

    def new
        @gig = Gig.new
    end

    def create
        @gig = Gig.new(gig_params)
        if @gig.save
            redirect_to gig_path(@gig)
        else
            render :new
        end
    end

    def index
        #@gigs = Gig.search(params[:query])
        if params[:user_id]
            if !User.find_by_id(params[:user_id]).nil?
                @gigs = User.find_by_id(params[:user_id]).gigs.order_by_date
            else
                flash[:notice] = "No gigs listed for this musician."
                redirect_to gigs_path
            end
        elsif params[:query]
            @gigs = Gig.search(params[:query])
        else
            @gigs = Gig.all.order_by_date
        end
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
            render :edit
        end        
    end

    def destroy
        gig = Gig.find_by_id(params[:id]).destroy
        flash[:notice] = "Gig deleted."
        redirect_to gigs_path
    end

    private

    def gig_params
        params.require(:gig).permit(:title, :event_type, :gig_status, :client, :street_address, :secondary_address, :city, :state, :zip, :start_time, :end_time, :production_schedule, :guest_list, user_ids:[], user_attributes: [:name, :instrument, :email])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
