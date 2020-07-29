module InvoicesHelper
    def invoice_link_header(current_user)
        if params[:user_id]
            link_to('Back to All Invoices', invoices_path) + tag(:br) +
            link_to('Back to All Gigs', gigs_path) + tag(:br) +
            link_to('Back to My Gigs', user_gigs_path(current_user)) + tag(:br) +
            link_to('Create New Invoice', new_invoice_path) + tag(:br) 
        else
            link_to('My Invoices', user_invoices_path(current_user)) + tag(:br) +
            link_to('Back to All Gigs', gigs_path) + tag(:br) +
            link_to('Back to My Gigs', user_gigs_path(current_user)) + tag(:br) +
            link_to('Create New Invoice', new_invoice_path) + tag(:br)
        end
    end

    def invoice_header(current_user)
        if params[:user_id]
            tag.h2("Invoices for #{current_user.name}")
        else
            tag.h2("Invoices")
        end
    end
 
end
