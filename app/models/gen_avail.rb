class GenAvail < ActiveRecord::Base

  validates_presence_of :gen_detail_id
	validates_presence_of :service_due_after
  belongs_to :gen_detail
  protokoll :genID, :pattern => "G%y###"

end
