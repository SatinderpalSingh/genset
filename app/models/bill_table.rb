class BillTable < ActiveRecord::Base
  belongs_to :quotation
  
  def self.to_csv
    CSV.generate do |csv|
      csv << ["bill_no", "calc_stax", "calc_surcharge", "calc_tds", "Bill Date"]
      all.each do |bill|
				csv << [bill.bill_no, bill.calc_stax, bill.calc_surcharge, bill.calc_tds, bill.created_at.to_formatted_s(:long_ordinal)]
      end
    end
  end
end
