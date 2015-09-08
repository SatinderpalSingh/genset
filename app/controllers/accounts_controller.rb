class AccountsController < ApplicationController
before_action :set_account, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
		@accounts = Account.all
  end

  def show
  end

  def new
		@account = Account.new
  end
	def create
		@account = Account.new(new_acc_params)
		respond_to do |format|
			if @account.save
        format.html { redirect_to controller: "accounts", action: "index", notice: 'Account was successfully added.' }
			end
		end
	end


  def edit
  end

  def update
	respond_to do |format|
      if @account.update(acc_params)
        format.html { redirect_to controller: "accounts", action: "index", notice: 'Account was successfully added.'  }
#       format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
#        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end


  end

	private
	
	def set_account
	@account = Account.find(params[:id])
	end

	def acc_params
	params.require(:account).permit(:name, :number, :ifsc, :micr)
	end

	def new_acc_params
    params.require(:account).permit(:name, :number, :ifsc, :micr)
	end

end
