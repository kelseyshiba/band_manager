module UsersHelper
    def users_header
        if params[:id]
            tag.h2("Edit User")
        else
            tag.h2("Sign Up")
        end
    end

    def profile_photo(user)
        if user.profile_photo.attached?
            image_tag(user.profile_photo.variant(resize_to_limit: [100, 100])) + tag(:br)
        end
    end

    def show_admin_links_show(user)
        if if_admin?
            link_to('Delete User', user_path(user), data: {confirm: 'Delete this User?'}, method: :delete) + tag(:br) + 
            link_to('Create New User', new_user_path) + tag(:br) +
            link_to('View All Users', users_path) + tag(:br)
        end
    end
end