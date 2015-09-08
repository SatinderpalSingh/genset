class ThirdPartyProvidersController < ApplicationController
  before_action :set_third_party_provider, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  # GET /third_party_providers
  # GET /third_party_providers.json
  def index
    @third_party_providers = ThirdPartyProvider.all
  end

  # GET /third_party_providers/1
  # GET /third_party_providers/1.json
  def show
  end

  # GET /third_party_providers/new
  def new
    @third_party_provider = ThirdPartyProvider.new
  end

  # GET /third_party_providers/1/edit
  def edit
  end

  # POST /third_party_providers
  # POST /third_party_providers.json
  def create
  @third_party_provider = ThirdPartyProvider.new(third_party_provider_params)
    if @third_party_provider.save
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  # PATCH/PUT /third_party_providers/1
  # PATCH/PUT /third_party_providers/1.json
  def update
    respond_to do |format|
      if @third_party_provider.update(third_party_provider_params)
        format.html { redirect_to :action => "index"}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /third_party_providers/1
  # DELETE /third_party_providers/1.json
  def destroy
    @third_party_provider.destroy
    respond_to do |format|
      format.html { redirect_to third_party_providers_url, notice: 'Third party provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_party_provider
      @third_party_provider = ThirdPartyProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def third_party_provider_params
      params.require(:third_party_provider).permit(:name, :address, :contactNo)
    end
end
