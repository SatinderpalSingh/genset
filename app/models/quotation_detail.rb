class QuotationDetail < ActiveRecord::Base
  belongs_to :client_detail
  belongs_to :sender_detail

  protokoll :referenceNumber, :pattern => "AE%y###"
end 
