class SetListsController < ApplicationController
    def index
        @gig = Gig.find_by_id(params[:gig_id])
        @set_lists = @gig.set_lists
    end

    def new
        @gig = Gig.find_by_id(params[:gig_id])
        @setlist = SetList.new
    end

    def create
        @setlist = SetList.new(setlist_params)
        if @setlist.save
            redirect_to gig_set_lists_path(params[:gig_id])
        else
            @gig = Gig.find_by_id(params[:gig_id])
            render :new
        end
    end

    private

    def setlist_params
        params.require(:set_list).permit(:gig_id, song_ids: [], song_attributes: [:title, :artist])
    end

end
