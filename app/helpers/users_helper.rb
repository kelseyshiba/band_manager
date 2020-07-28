module UsersHelper
    def users_header
        if params[:id]
            tag.h1("Edit User")
        else
            tag.h1("Sign Up!")
        end
    end
end
