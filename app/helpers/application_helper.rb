module ApplicationHelper
    def show_admin_links(current_user)
        link_to('All Invoices', invoices_path) + tag(:br) +
        link_to('All Users', users_path) + tag(:br) +
        link_to('Create New Gig', new_gig_path)
    end
end
