class QtMailer < ApplicationMailer
	def qt_email(client, sender, pdf)
		@client = client
		@sender = sender
	  attachments['Quotation.pdf'] = pdf
	  mail to: @client.emailID, from: @sender.emailID, subject: 'New generator'
	end
	def tax_report_email(to, from, subject, file, filename)
	  attachments[filename] = file
	  mail to: to, from: from, subject: subject
	end

	def email_at_intervals
 	  @client_detail = ClientGenSet.all
	  @client_detail.each do |client|
		@gen_set = client
		@client_id = client.client_detail_id
		@client_object = ClientDetail.find(@client_id)
		@sender_id = @client_object.sender_details_id
          	@sender_object = SenderDetail.find(@sender_id)	

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
	  attachments['Bill.pdf'] = pdf
	  mail to: @client_object.emailID, from: @sender_object.emailID, subject: 'Bill of month'
	end
	end
end
