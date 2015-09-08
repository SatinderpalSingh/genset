class ServiceHoursController < ApplicationController
 # def index
 # end

  def show
  end

  def create
		@service_hours = ServiceHour.new(service_hours_params)
		old_value = ServiceHour.where(client_gen_set_id: params[:service_hour][:client_gen_set_id]).order("created_at").last

		if old_value.blank?
			respond_to do |format|
				if @service_hours.save
					format.html { redirect_to @service_hours, notice: 'Success!' }
					format.json {render json: @service_hours, status: :ok}
			  else
				  format.html { render action: 'new' }
					format.json { render json: @service_hours, status: :unprocessable_entity }
			  end

 	      end

  else
			respond_to do |format|
				if @service_hours.save
					format.html { redirect_to @service_hours, notice: ' Success!' }
					format.json {render json: @service_hours, status: :ok}
			  else
				  format.html { render action: 'new' }
					format.json { render json: @service_hours, status: :unprocessable_entity }
			  end

 	      end
	   end
	end

	def service_hours_params
		params.require(:service_hour).permit(:working_hours, :client_gen_set_id)
	end

end
