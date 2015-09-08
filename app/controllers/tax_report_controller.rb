class TaxReportController < ApplicationController
	before_action :authenticate_user! 

  def index
    if not params[:start_date].blank?
      start_d =  Date::civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      end_d = Date::civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)

      start_d = start_d.beginning_of_day
      end_d = end_d.end_of_day
    end
    if not params[:start_date].blank?
      @bill = BillTable.where(created_at: (start_d)..end_d)
    else
      @bill = BillTable.all
    end
    respond_to do |format|
      format.html
      format.csv {render text: @bill.to_csv}
    end
  end
	def mailReport
		filename = "Full Report"
    if not params[:start_date].blank?
      start_d =  Date::civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      end_d = Date::civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)

      start_d = start_d.beginning_of_day
      end_d = end_d.end_of_day
		 filename = start_d.to_formatted_s(:long_ordinal) + " TO " + end_d.to_formatted_s(:long_ordinal)
    end
    if not params[:start_date].blank?
      @bill = BillTable.where(created_at: (start_d)..end_d)
    else
      @bill = BillTable.all
    end
		 to = EmailAddresse.find_by(name: "accountant")
		 from = EmailAddresse.find_by(name: "my")
		 filename = filename + ".csv"
		 QtMailer.tax_report_email(to.address , from.address, "Tax Reports: " + filename, @bill.to_csv, filename).deliver
     respond_to do |format|
            format.json { head :no_content }
		 end
	end



end

