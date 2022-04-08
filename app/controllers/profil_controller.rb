class ProfilController < ApplicationController
        before_action :authenticate
        def new 
        end

        def edit 
        end

        def show
                @current_appointments = user_appointments(current_user.id)
        end

        def update
        end

        def destroy 
        end

end