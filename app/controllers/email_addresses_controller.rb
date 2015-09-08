class EmailAddressesController < ApplicationController
before_action :set_account, only: [:edit, :update]
before_action :authenticate_user!

def index
 @email_addresses = EmailAddresse.all  
end

def show
end

def edit
end

def show
end

def new
 @email_address = EmailAddresse.new
end

def create
    @email_address = EmailAddresse.new(new_email_addresse_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to email_addresses_path }
#        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
#        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
end

def update
    respond_to do |format|
      if @email_address.update(email_addresse_params)
        format.html { redirect_to email_addresses_path }
#        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
#        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
end



 private
    # Use callbacks to share common setup or constraints between actions.
	def set_account
	@email_address = EmailAddresse.find(params[:id])
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_addresse_params
      params.require(:email_addresse).permit(:name, :address)
    end
    def new_email_addresse_params
      params.require(:email_addresse).permit(:name, :address)
    end



end
