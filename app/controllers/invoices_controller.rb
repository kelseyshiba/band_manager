class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit]
    before_action :authorized, only: [:index, :edit, :show, :new]
    
    def new
        @invoice = Invoice.new
        @user = User.find_by_id(params[:user_id])
    end
    
    def create
        # <ActionController::Parameters {"authenticity_token"=>"67A06cF+rRMuLP/vFRblOPC4i9P0yuiKkZ0UTOmZJfhOUxUgFL3KQB7u6hZJr2Q7j8SAOo7vsrO5xHhy/7aQ8Q==", "invoice"=>{"date"=>"2020-07-29T10:03", "amount"=>"200.00", "description"=>"Hey this gig was fun!", "gig_id"=>"1", "user_id"=>"16"}, "commit"=>"Create Invoice", "controller"=>"invoices", "action"=>"create"} permitted: false>
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
            redirect_to user_invoice_path(current_user, @invoice)
        else
            flash[:notice] = @invoice.errors.full_messages.join(", ")
            render :'invoices/new'
        end
    end

    def index
        if params[:user_id]
            if !User.find_by_id(params[:user_id]).nil?
                @invoices = User.find_by_id(params[:user_id]).invoices.order_by_date
            else
                flash[:notice] = "No invoices listed for this musician."
                redirect_to gigs_path
            end            
        else
            @invoices = Invoice.all
        end
    end

    def show

    end

    def edit
        @user = User.find_by_id(params[:user_id])
    end

    def update
        #{"authenticity_token"=>"vZLjWuDs9GOZsIGtqd5OtH0o6arFuN+aSCKDgAf5GtQYccKTNS+TMKlylFT1Z8+3AlTiQ7+dhaNge+++Edav3Q==", "invoice"=>{"date"=>"2020-07-29T03:52:28", "amount"=>"44.55", "description"=>"[\"Id qui consequatur.\", \"Blanditiis illo sunt.\", \"Odit voluptas distinctio.\"]", "gig_id"=>"7"}, "commit"=>"Save Invoice", "id"=>"1"}
        @invoice = Invoice.find_by_id(params[:id])
        @invoice.update(invoice_params)
        if @invoice.save 
            redirect_to user_invoice_path(@invoice.user, @invoice)
        else
            flash[:notice] = @invoice.errors.full_messages.join(",")
            render :edit
        end
    end

    def destroy
        Invoice.find_by_id(params[:id]).destroy
        user = User.find_by_id(params[:user_id])
        redirect_to user_invoices_path(user)
    end

    private

    def invoice_params
        params.require(:invoice).permit(:date, :amount, :description, :gig_id, :user_id)
    end
    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
end
