class SenderDetail < ActiveRecord::Base
  has_attached_file :signature, :styles => { :small => "150x150>", med: "200x200", large: "300x300"},
                    :url  => "/assets/sender_signature/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/sender_signature/:id/:style/:basename.:extension"
  validates_attachment_presence :signature
  validates_attachment :signature, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

 
  validates_presence_of :contactNo
  validates_format_of :contactNo, with: /[0-9]/
  validates_length_of :contactNo, :maximum =>12, :minimum => 4

  validates_presence_of :quotationType
end
