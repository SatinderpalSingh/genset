class FakeQuotationsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index
  	@fake_quotation = FakeQuotation.all
  end

  def show
    @fake_quotation = FakeQuotation.find(params[:id])
    @client_detail  = ClientDetail.find(@fake_quotation.client_details_id)
    @sender_detail  = SenderDetail.find(@fake_quotation.sender_details_id)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'Quotation',
        :template => 'fake_quotations/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :page_size => 'A4',
        :dpi => '300',
        outline: {  outline:           true,
                    outline_depth:     1 },
        margin:  {  top:               0,                     # default 10 (mm)
                    bottom:            0,
                    left:              0,
                    right:             0},        
        :show_as_html => params[:debug].present?
      end       
    end    
  end

  def new
    @fake_quotation = FakeQuotation.new
  end
  
  def create
    @fake_quotation = FakeQuotation.new(fake_quotation_params)
    if @fake_quotation.save  
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def update
    fakeQuotation                    = FakeQuotation.find(params[:id])
    fakeQuotation.date               = params[:content][:fakeQuotation_date][:value]
    fakeQuotation.subject            = params[:content][:fakeQuotation_subject][:value]
    fakeQuotation.regard             = params[:content][:fakeQuotation_regard][:value]    
    fakeQuotation.regardContent      = params[:content][:fakeQuotation_regardContent][:value]  
    fakeQuotation.bankZoneOne        = params[:content][:fakeQuotation_bankZoneOne][:value]
    fakeQuotation.bankZoneTwo        = params[:content][:fakeQuotation_bankZoneTwo][:value]
    fakeQuotation.bankNameThree      = params[:content][:fakeQuotation_bankNameThree][:value]
    fakeQuotation.bankNameFour       = params[:content][:fakeQuotation_bankNameFour][:value]
    fakeQuotation.bankNameFive       = params[:content][:fakeQuotation_bankNameFive][:value]
    fakeQuotation.quotationLine      = params[:content][:fakeQuotation_quotationLine][:value]
    fakeQuotation.quotationRateList  = params[:content][:fakeQuotation_quotationRateList][:value]
    fakeQuotation.contentPartOne     = params[:content][:fakeQuotation_contentPartOne][:value] 
    fakeQuotation.contentPartTwo     = params[:content][:fakeQuotation_contentPartTwo][:value]
    fakeQuotation.thankYou           = params[:content][:fakeQuotation_thankYou][:value]
    fakeQuotation.yoursTruly         = params[:content][:fakeQuotation_yoursTruly][:value]
    fakeQuotation.nameOfCompany      = params[:content][:fakeQuotation_nameOfCompany][:value]
    fakeQuotation.emailIdOne         = params[:content][:fakeQuotation_emailIdOne][:value]
    fakeQuotation.emailIdTwo         = params[:content][:fakeQuotation_emailIdTwo][:value]
    fakeQuotation.emailIdThree       = params[:content][:fakeQuotation_emailIdThree][:value]
    fakeQuotation.emailIdFour        = params[:content][:fakeQuotation_emailIdFour][:value]
    fakeQuotation.contactNumberOne   = params[:content][:fakeQuotation_contactNumberOne][:value]
    fakeQuotation.contactNumberTwo   = params[:content][:fakeQuotation_contactNumberTwo][:value]
    fakeQuotation.contactNumberThree = params[:content][:fakeQuotation_contactNumberThree][:value]

    fakeQuotation.save!  

    render text: ''
  end

  def notice
  end
  def mail
    @fake_quotation = FakeQuotation.find(params[:id])
    @client_detail  = ClientDetail.find(@fake_quotation.client_details_id)
    @sender_detail  = SenderDetail.find(@fake_quotation.sender_details_id)
    pdf = render_to_string :pdf => 'Quotation', 
                           :template => 'fake_quotations/mail.pdf.erb', 
                           :layout => 'pdf.html.erb', :page_size => 'A4',
                           :show_as_html => params[:debug].present?

   QtMailer.qt_email(@client_detail, @sender_detail, pdf).deliver
   @fake_quotation.mailStatus = true
   @date = DateTime.now.to_date
   @fake_quotation.dateOfMail = @date

   @fake_quotation.save
   redirect_to action: 'notice' 
  end

  
  private

  def fake_quotation_params
    params.require(:fake_quotation).permit()
  end

end
