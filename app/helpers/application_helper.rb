module ApplicationHelper
    def authenticate
        unless user_signed_in?
            redirect_to new_user_session_path
        end
        return true
    end
end
