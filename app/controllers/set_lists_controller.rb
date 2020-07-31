class SetListsController < ApplicationController
    before_action :set_gig, only: [:index, :edit]
    before_action :get_setlist, only: [:update, :destroy, :edit]

    def index
        @set_lists = @gig.set_lists
    end

    def new
        @gig = Gig.find_by_id(params[:gig_id])
        @setlist = SetList.new
    end

    def create
        #CHECK MARKS
        # <ActionController::Parameters {"authenticity_token"=>"k/TJErpkmkhZDlDPJih/4TVQpyukTDklclCpSjcRgSov2Pana59iC0HRPDXLx+LwOff7IM/pVOXYuR2n5Gd54g==", "set_list"=>{"gig_id"=>"16", "song_ids"=>["", "1"], "song_attributes"=>{"title"=>"", "artist"=>""}}, "commit"=>"Create Set list", "controller"=>"set_lists", "action"=>"create", "gig_id"=>"16"} permitted: false>
        ##EMPTY
        # <ActionController::Parameters {"authenticity_token"=>"KQSaA0BEsdTpVLfRyhXTibD/TRBW+wbr9J+GJXFGjQFdjs9TuYM6iAbSsIDx/Vm8Nelqwd8E8ZqzsiG2ZIUPEQ==", "set_list"=>{"gig_id"=>"16", "song_ids"=>[""], "song_attributes"=>{"title"=>"", "artist"=>""}}, "commit"=>"Create Set list", "controller"=>"set_lists", "action"=>"create", "gig_id"=>"16"} permitted: false>

        #CREATE NEW SONG
        # <ActionController::Parameters {"authenticity_token"=>"KQSaA0BEsdTpVLfRyhXTibD/TRBW+wbr9J+GJXFGjQFdjs9TuYM6iAbSsIDx/Vm8Nelqwd8E8ZqzsiG2ZIUPEQ==", "set_list"=>{"gig_id"=>"16", "song_ids"=>[""], "song_attributes"=>{"title"=>"New Song", "artist"=>"New Artist"}}, "commit"=>"Create Set list", "controller"=>"set_lists", "action"=>"create", "gig_id"=>"16"} permitted: false>
        @setlist = SetList.new(setlist_params)

        if @setlist.save #validations fire #here is where it stops
            redirect_to gig_set_lists_path(params[:gig_id])
        else
            @gig = Gig.find_by_id(params[:gig_id])
            render :new
        end
    end

    def edit
       
    end

    def update    
        @setlist.update(setlist_params)
        if @setlist.valid?
            redirect_to gig_set_lists_path(params[:gig_id])
        else
            render :edit
        end
    end

    def destroy
        # <ActionController::Parameters {"_method"=>"delete", "authenticity_token"=>"PmKosEukAIc2dX7tc2YLWlKYZ+iyTGXmSfaiqGqd8mBK6P3gsmOL29nzebxIjoFv145AOTuzkpcO2wU7f15wcA==", "controller"=>"set_lists", "action"=>"destroy", "gig_id"=>"1", "id"=>"4"} permitted: false>
        @setlist.destroy
        flash[:notice] = "Set List Deleted."
        redirect_to gig_set_lists_path(params[:gig_id])
        
    end

    private

    def setlist_params
        params.require(:set_list).permit(:title, :gig_id, song_ids:[], song_attributes: [:title, :artist])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:gig_id])
    end

    def get_setlist
        @setlist = SetList.find_by_id(params[:id])
    end

end
