class SenderDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sender_detail, only: [:show, :edit, :update, :destroy]

  def index
    @sender_detail = SenderDetail.all
  end

  def new
    @sender_detail = SenderDetail.new
  end

  def create
    @sender_detail = SenderDetail.new(sender_detail_params)
    if @sender_detail.save  
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
  end
  
  def show
  end

  def update
    respond_to do |format|
      if @sender_detail.update(sender_detail_params)
        format.html { redirect_to :action => "index"}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @sender_detail.destroy
    respond_to do |format|
      format.html { redirect_to sender_details_url, notice: 'Sender detail was successfully destroyed.' }
    end
  end

  private
    def set_sender_detail
      @sender_detail = SenderDetail.find(params[:id])
    end

    def sender_detail_params
      params.require(:sender_detail).permit(:name, :emailID, :address, :contactNo, :signature, :quotationType)
    end

end
