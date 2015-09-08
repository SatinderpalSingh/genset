class TransactionsController < ApplicationController
	before_action :authenticate_user! 
  def index
		@accounts = Account.all
  end

  def add
		@transaction = Transaction.new
  end

	def create
    @tx = Transaction.new(tx_params)
		respond_to do |format|
		if @tx.save
			#Find ouit the total bill amount including all expenses + rents, dedudct the paid costs, and update pending somewhere in table.
			@bill = BillTable.find(params[:transaction][:bill_id])
			@bill.pending_payment = @bill.pending_payment.to_i - params[:transaction][:amount].to_i
			@bill.save
			flash[:notice] = "You have successfully logged out."
        format.html { redirect_to controller: "gen_expenses", action: "index", notice: 'Gen expense was successfully created.' }
		end
		end
	end
  private
  def tx_params
    params.require(:transaction).permit(:payment_type, :amount, :date, :transaction_remarks, :bill_id)
  end
end
