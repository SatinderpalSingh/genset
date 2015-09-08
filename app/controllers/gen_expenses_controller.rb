class GenExpensesController < ApplicationController
    before_action :set_gen_expense, only: [:edit, :update, :destroy]
		before_action :authenticate_user!
    def index
    end
    def show
        @client = ClientDetail.find(params[:id])
        @notice = params[:notice]
        date = DateTime.now
        @gen_expense = GenExpense.where("client_detail_id = ? and date between ? and ?", 
                                        params[:id], date.beginning_of_month, 
                                        date.end_of_month)
        @client_gen_set = ClientGenSet.where(client_detail_id: params[:id])
        respond_to do |format|
            format.html
            format.pdf do
                render :pdf => 'Quotation',
                    :template   => 'gen_expense/bill.pdf.erb',
                    :layout     => 'pdf.html.erb',
                    :page_size  => 'A4',
                    :dpi        => '300',
                    outline: {  outline:           true,
                                outline_depth:     1 },
                                margin:  {  top:               0,
                                            bottom:            0,
                                            left:              0,
                                            right:             0},        
                                            :show_as_html => params[:debug].present?
            end       
        end    

    end

    def download
        send_file Rails.root.join('billarchieve', params[:file].to_s), :type=>"application/pdf", :x_sendfile=>true
    end

    def profit_loss
	@bill = BillTable.all
    end

    def party_list
    end
    
		def party_providers
    end

    #   def transaction
    #   def addTransactiom
    #   end

    def get_bill
        date = DateTime.now.to_date
        dieselExpenses = 0
        otherExpenses =0
        @gen_set = ClientGenSet.find(params[:id])
        @client_detail = ClientDetail.find(@gen_set.client_detail_id)
        @sender_detail = SenderDetail.find(@client_detail.sender_details_id)
	if @client_detail.bank_id
        @bank_name = Bank.find(@client_detail.bank_id)
	else
	@bank_name = ""
	end
        genRent = @gen_set.genRent.to_i
        #@gen_avail = GenAvail.find(@gen_set.gen_avail_id)
        @gen_expenses = GenExpense.where("client_detail_id = ? and date between ? and ?", 
                                         @gen_set.client_detail_id,  date.beginning_of_month, 
                                         date.end_of_month)
        @gen_expenses.each do |expense|
            if (expense.client_detail_id == @gen_set.client_detail_id)
                dieselExpenses += expense.dieselCharge
                otherExpenses  += expense.otherExpenses
            end
        end 

        gaurdpay = @gen_set.gaurd_detail.monthlySalary 
        if( date.month.to_s == @gen_set.approveMonth && date.year.to_s == @gen_set.approveYear)
          number_of_days = date.end_of_month.day.to_i - @gen_set.approveDate.to_i + 1
          genRent = (@gen_set.genRent/date.end_of_month.day.to_i) * number_of_days 
          gaurdpay = (gaurdpay/date.end_of_month.day.to_i) * number_of_days
        end
        totalExp = dieselExpenses + otherExpenses + gaurdpay.to_d
				totalExp = totalExp.round(1)
        @totalExp =totalExp
				@totalwithouttax = (totalExp.to_d + genRent.to_d).round(1)
        serviceTax = (@totalwithouttax.to_d * @gen_set.serviceTax.to_s.to_d) / 100
        surcharge = (serviceTax.to_s.to_d * @gen_set.eduTax.to_s.to_d) / 100
        total = @totalwithouttax + serviceTax + surcharge
				total = total.round(1)
        @total = total
        if(@gen_set.gen_avail_id.blank?)
            @tpg = ThirdPartyGen.find(@gen_set.third_party_gen_id)
            genID = @tpg.genID
						provId = @tpg.third_party_provider_id
            if(@tpg.gen_detail.blank?)
                genType = @tpg.gen_detail.genType
            else
                genType = "Gen Type not available"
            end
        else
            @fpg = GenAvail.find(@gen_set.gen_avail_id)
            genID = @fpg.genID

            genType = @fpg.gen_detail.genType
        end



        @notice = params[:notice]
        date = Time.now.strftime("%d-%m-%Y")
        id = 1
        @bill =  "AE-%.6d" % @gen_set.id
        billmonth = Date.today.strftime("%Y%m")
        @bill = billmonth.to_s + "-" + @bill
        bill = @bill
        @filename = @bill+'.pdf'
        @bill_table = BillTable.new
        @bill_table.tds = @gen_set.tds
        @bill_table.total = total
        @bill_table.total_exp = @totalExp
        @bill_table.pending_payment = total
        @bill_table.quotation_id = @gen_set.quotation_detail_id
	if not @bank_name = ""
        @bill_table.bank_name = @bank_name.name
	else
	@bill_table.bank_name = ""
	end
        @bill_table.bank_branch = @client_detail.bank_branch
        @bill_table.gen_desc = genID
        @bill_table.third_party_provider_id = provId
        @bill_table.rate =  @gen_set.genRent
        @bill_table.quotation_id = @gen_set.quotation_detail_id
        @bill_table.surcharge = @gen_set.eduTax
        @bill_table.calc_surcharge = surcharge
        @bill_table.service_tax = @gen_set.serviceTax
        @bill_table.calc_stax= serviceTax
				@bill_table.calc_tds= ((total / 100) * @gen_set.tds)
        @bill_table.date = date
        @bill_table.bill_no = @bill

        @bill_table.save    

        pdf = WickedPdf.new.pdf_from_string( render_to_string(:pdf => 'bill', 
                                                              :template => 'qt_mailer/email_at_intervals.pdf.erb'), 
                                                              :layout     => 'pdf.html.erb',
                                                              :page_size  => 'A4',
                                                              :dpi        => '300',
                                                              outline: {  outline:           true,
                                                                          outline_depth:     1 },
                                                                          margin:  {  top:               0,
                                                                                      bottom:            0,
                                                                                      left:              0,
                                                                                      right:             0} 
                                           )

        pdf = render_to_string pdf: "bill", template: "qt_mailer/email_at_intervals.pdf.erb", encoding: "UTF-8"
        save_path = Rails.root.join('billarchieve',@filename)
        File.open(save_path, 'wb') do |file|
            file << pdf
        end
        render :text => pdf

    end

    def new
        @gen_expense = GenExpense.new
				@diesel_reading = DieselReading.new
        @approved_client = ClientDetail.find(params[:id])
    end

    def edit
        @approved_client = ClientDetail.find(@gen_expense.client_detail_id)
    end

    def create
        @gen_expense = GenExpense.new(gen_expense_params)
				if params[:gen_expense][:hour_meter_set] == 'TRUE'
					client_gen_set = ClientGenSet.where(client_detail_id: params[:gen_expense][:client_detail_id]).last
					client_gen_set_id = client_gen_set.id
					ServiceHour.create(:client_gen_set_id => client_gen_set_id, :working_hours => '0')

				end

			#	params[:diesel_readings][:remaining_fuel]
				@diesel_reading = DieselReading.new(diesel_reading_params)
				@diesel_reading.save

				# To update latest remaining fuel
				new_reading = DieselReading.new(diesel_reading_params)
				new_reading.remaining_fuel = new_reading.remaining_fuel + new_reading.added_fuel
				new_reading.added_fuel = nil
				new_reading.save

			 	respond_to do |format|
            if @gen_expense.save
                format.html { redirect_to action: "show", id: @gen_expense.client_detail_id, notice: 'Expenses successfully added.' }
                format.json { render :show, status: :created, location: @gen_expense }
            else
                format.html { render :new }
                format.json { render json: @gen_expense.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @gen_expense.update(gen_expense_params)
                format.html { redirect_to action: "show", id:@gen_expense.client_detail_id, notice: 'Gen expense was successfully updated.' }
                format.json { render :show, status: :ok, location: @gen_expense, id: @gen_expense.client_detail_id }
            else
                format.html { render :edit }
                format.json { render json: @gen_expense.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        client_detail_id = @gen_expense.client_detail_id
        @gen_expense.destroy
        respond_to do |format|
            format.html { redirect_to action: "show", id: client_detail_id, notice: 'Gen expense was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_gen_expense
        @gen_expense = GenExpense.find(params[:id])
    end

    def gen_expense_params
        params.require(:gen_expense).permit(:date, :reading, :readingBy, :batteryStatus, :radiatorStatus, :dieselCharge, :otherExpenses, :client_detail_id, :serviced, :hour_meter_set)
    end

		def diesel_reading_params
			params.require(:diesel_reading).permit(:remaining_fuel, :added_fuel, :client_gen_set_id)
		end
end
