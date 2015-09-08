class ThirdPartyProvider < ActiveRecord::Base

  validates_presence_of :contactNo
  validates_format_of :contactNo, with: /[0-9]/
  validates_length_of :contactNo, :maximum =>12, :minimum => 4

end
