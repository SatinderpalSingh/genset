class DieselReadingsController < ApplicationController
	before_action :authenticate_user! 
#		  respond_to :html, :js

#  def index
#  end

  def show
  end

  def create
		@diesel_reading = DieselReading.new(diesel_reading_params)
		old_value = DieselReading.where(client_gen_set_id: params[:diesel_reading][:client_gen_set_id]).order("created_at").last

		if not old_value.blank?
  		if (@diesel_reading.remaining_fuel <= old_value.remaining_fuel && @diesel_reading.remaining_fuel > 0)
  			respond_to do |format|

				if @diesel_reading.save
					format.html { redirect_to @diesel_reading, notice: 'Client was successfully created.' }
					format.json {render json: @diesel_reading, status: :ok}
			  else
				  format.html { render action: 'new' }
					format.json { render json: @diesel_reading.errors, status: :unprocessable_entity }
			  end

 	      end
	   end

		else

			respond_to do |format|

				if @diesel_reading.save
					format.html { redirect_to @diesel_reading, notice: 'Client was successfully created.' }
					format.json {render json: @diesel_reading, status: :ok}
			  else
				  format.html { render action: 'new' }
					format.json { render json: @diesel_reading.errors, status: :unprocessable_entity }
  		  end

		  end

 end
	end

	def diesel_reading_params
		params.require(:diesel_reading).permit(:remaining_fuel, :added_fuel, :client_gen_set_id)
	end
end
