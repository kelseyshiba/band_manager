class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit]

    def new

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

    end

    def update

    end

    private

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
end
