class ThirdPartyGen < ActiveRecord::Base
  
  belongs_to :third_party_provider
  belongs_to :gen_detail
  protokoll :genID, :pattern => "TP###"
  validates_presence_of :service_due_hours
end
