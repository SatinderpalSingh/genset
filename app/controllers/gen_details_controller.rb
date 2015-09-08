class GenDetailsController < ApplicationController
  before_action :set_gen_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  # GET /gen_details
  # GET /gen_details.json
  def index
    @gen_details = GenDetail.all
    @gen_avails = GenAvail.all 
    @notice = params[:notice]
  end

  # GET /gen_details/1
  # GET /gen_details/1.json
  def show
  end

  # GET /gen_details/new
  def new
    @gen_detail = GenDetail.new
    @gen_avail = GenAvail.new
  end

  # GET /gen_details/1/edit
  def edit
    @gen_avail = GenAvail.where(gen_detail_id: @gen_detail.id) 
  end

  # POST /gen_details
  # POST /gen_details.json
  def create
    @gen_detail = GenDetail.new(gen_detail_params)
#@gen_detail.genConsumption = @gen_detail.genConsumption.to_d.round(2)
    respond_to do |format|
      if @gen_detail.save
#	@gen_avail = GenAvail.new(gen_avail_params)

       (1..@gen_detail.total_gen).each do |i|
          @gen_avail = GenAvail.new
          @gen_avail.available = true
          @gen_avail.gen_detail_id = @gen_detail.id
	  @gen_avail.genConsumption = params[:gen_avails][:genConsumption]
	  @gen_avail.service_due_after = params[:gen_avails][:service_due_after] 
          @gen_avail.save

        end 

        format.html { redirect_to :action => "index"}
      else
        format.html { render :new }
        format.json { render json: @gen_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gen_details/1
  # PATCH/PUT /gen_details/1.json
  def update
    respond_to do |format|
      if @gen_detail.update(gen_detail_params)
        format.html { redirect_to action: "index", notice: "Generator Type is updated successfully."}
      else
        format.html { render :edit }
        format.json { render json: @gen_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_details/1
  # DELETE /gen_details/1.json
  def destroy
    @gen_avail = GenAvail.where(gen_detail_id: @gen_detail.id)
    if @gen_detail.destroy
      @gen_avail.each do |g|
        g.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Gen detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gen_detail
      @gen_detail = GenDetail.find(params[:id])
    end
=begin	def gen_avail_params
	    params.require(:gen_avail).permit(:genConsumption,:service_due_after)
	end
=end
    # Never trust parameters from the scary internet, only allow the white list through.
    def gen_detail_params
      params.require(:gen_detail).permit(:genType, :genRent, :total_gen)
    end

end
