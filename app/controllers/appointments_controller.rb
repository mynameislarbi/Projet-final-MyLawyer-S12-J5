class AppointmentsController < ApplicationController
    before_action :authenticate
    def index
        @appointments = Appointment.all
        respond_to do |format|
            format.js { }
        end
    end

    def create
        @appointment = Appointment.new(post_params)
        if @appointment.save
            redirect_to profil_path(current_user.id)
        end
    end
    
    def destroy
        Appointment.find(params[:firm_id].to_i).destroy
        redirect_to profil_path(current_user.id)
    end

    def update
        @appointment = Appointment.find(params[:id].to_i)
        @appointment.update(is_confirmed: !@appointment.is_confirmed)
        if @appointment.client_id == nil 
            @appointment.update(client_id: current_user.id)
        else 
            @appointment.update(client_id: nil)
        end
        respond_to do |format|
            format.html { redirect_to profil_path(current_user.id) }
            format.js { }
        end
    end

    private

    def post_params
        params[:firm_id] = current_user.firm_id
        params[:is_confirmed] = false
        params[:is_paid] = false
        params[:lawyer_id] = current_user.id
        params[:start_date] = (params[:date] + " " + params[:time]).to_datetime
        params.permit(:start_date, :is_confirmed, :is_paid, :firm_id, :lawyer_id)
    end
end