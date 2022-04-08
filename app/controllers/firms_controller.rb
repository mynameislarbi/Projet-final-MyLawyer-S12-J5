class FirmsController < ApplicationController
    def index
        if params[:zip_code].to_i == 0
            params[:zip_code] = 1
        end
        @zip_id = Departement.find_by(zip_code: params[:zip_code]).id
        respond_to do |format|
            format.html { }
            format.js { }
        end
    end

    def show
        @lawyers = User.all
        @firm = Firm.find(params[:id])
        @law_types = LawTypesByFirm.find_by(firm_id: params[:id])
    end


    def new

    end

    def create
        @firm = Firm.new(post_params)
        if @firm.save
            session[:new_firm] = @firm.id
            redirect_to "/firm/#{@firm.id}"
        else
            flash.now[:error] = @firm.errors.messages
            render new_registration_path
        end
    end

    private

    def post_params
        params[:rating] = nil
        params[:departement_id] = params[:departement_id].to_i
        params.permit(:name, :address, :phone_number, :email, :departement_id, :rating)
    end
end
