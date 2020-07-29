class InvoicesController < ApplicationController
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
end
