class SetListsController < ApplicationController
    before_action :set_gig, only: [:index, :new, :edit]

    def index
        @set_lists = @gig.set_lists
    end

    def new
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

    def edit
        @setlist = SetList.find_by_id(params[:id])
    end

    def update
        # <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"2mgPOMYMrAv399k0vB6NjHLR2OfwnWA8Wph+65X8Zu+u4lpoP8snVxhx3mWH9ge598f/Nnlil00dtdl4gD/k/w==", "set_list"=>{"song_ids"=>["", "2", "3"], "song_attributes"=>{"title"=>"Mama Bahama", "artist"=>"Joey"}}, "commit"=>"Update Set list", "controller"=>"set_lists", "action"=>"update", "gig_id"=>"1", "id"=>"8"} permitted: false>

        # <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"9fMg12X1t+1fKv90ix1v7gFRrWZAlaRObapbGPXJcN6BeXWHnDI8sbCs+CWw9eXbhEeKt8lqUz8qh/yL4Aryzg==", "set_list"=>{"song_ids"=>[""], "song_attributes"=>{"title"=>"", "artist"=>""}}, "commit"=>"Update Set list", "controller"=>"set_lists", "action"=>"update", "gig_id"=>"1", "id"=>"8"} permitted: false>
        @setlist = SetList.find_by_id(params[:id])
        @setlist.update(setlist_params)
        if @setlist.valid?
            redirect_to gig_set_lists_path(params[:gig_id])
        else
            render :edit
        end
    end

    def destroy

    end

    private

    def setlist_params
        params.require(:set_list).permit(:gig_id, song_ids: [], song_attributes: [:title, :artist])
    end

    def set_gig
        @gig = Gig.find_by_id(params[:gig_id])
    end

end
