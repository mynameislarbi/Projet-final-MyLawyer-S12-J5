module ProfilHelper
    def user_appointments(user_id)
        @current_appointments = []
        Appointment.all.each do |appointment|
            if (appointment.client_id == user_id || appointment.lawyer_id == user_id ) && appointment.start_date > Time.now
                @current_appointments << appointment
            end
        end
        return @current_appointments
    end
end
