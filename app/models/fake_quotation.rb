class FakeQuotation < ActiveRecord::Base
  belongs_to :client_details
  belongs_to :sender_details

  protokoll :referenceNumber, :pattern => "AEQF%y###"  
end
