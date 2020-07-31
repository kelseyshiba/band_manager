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
            image_tag(user.profile_photo) + tag(:br)
        elsif user.profile_photo_url
            image_tag(user.profile_photo_url) + tag(:br)
        else
            content_tag(:p, user.initials) + tag(:br)
        end
    end
end