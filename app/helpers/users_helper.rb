module UsersHelper
    def users_header
        if params[:id]
            tag.h2("Edit User")
        else
            tag.h2("Sign Up")
        end
    end
end
