class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :edit]
    before_action :authorized, only: [:show, :index, :edit, :new]
    before_action :if_admin?, only: [:edit, :new]

    def new
        @gig = Gig.new
    end

    def create
        # <ActionController::Parameters {"authenticity_token"=>"mztrPxDobjZycJZdTsth85+NTrOQr/JnWES3x/XFjzHrziP74A9/DZ8Lpu8D1tL1Q7NfszpEGfpHAA5FEE3qCw==", "gig"=>{"title"=>"Groundhog Day", "event_type"=>"Repeated", "booking_status"=>"Pending", "client"=>"Groundhog", "street_address"=>"00 Underground", "secondary_address"=>"", "city"=>"Greeley", "state"=>"CO", "zip"=>"80033", "start_time"=>"2020-07-31T16:00", "end_time"=>"2020-07-31T21:00", "production_schedule"=>"Repeated Stuff", "guest_list"=>"Elephant", "user_ids"=>["", "10", "17"], "user_attributes"=>{"name"=>"Kelsey Shiba", "instrument"=>"Melodica", "email"=>"developerkelseyshiba@gmail.com", "new_user_email"=>"1"}}, "commit"=>"Create Gig", "controller"=>"gigs", "action"=>"create"} permitted: false>
    
        @gig = Gig.new(gig_params)
        if @gig.save
            if params[:gig][:user_attributes][:new_user_email] == "1"
                @receiver = User.find_or_create_by(email: params[:gig][:user_attributes][:email])
                @sender = current_user
                UserMailer.new_user_email(@receiver, @sender).deliver_now
                #email.deliver_later
                flash[:notice] = 'Email sent to new user.'
                redirect_to gig_path(@gig)
            else
                redirect_to gig_path(@gig)
            end
        else
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
        params.require(:gig).permit(:title, :event_type, :booking_status, :client, :street_address, :secondary_address, :city, :state, :zip, :start_time, :end_time, :production_schedule, :guest_list, user_ids:[], user_attributes: [:name, :instrument, :email])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:id])
    end
end
