class ClientPublishingSettingsController < ApplicationController
  before_action :set_client_publishing_setting, only: [:show, :edit, :update, :destroy]

  # GET /client_publishing_settings
  # GET /client_publishing_settings.json
  def index
    @client_publishing_settings = ClientPublishingSetting.all
  end

  # GET /client_publishing_settings/1
  # GET /client_publishing_settings/1.json
  def show
  end

  # GET /client_publishing_settings/new
  def new
    @client_publishing_setting = ClientPublishingSetting.new
  end

  # GET /client_publishing_settings/1/edit
  def edit
  end

  # POST /client_publishing_settings
  # POST /client_publishing_settings.json
  def create
    @client_publishing_setting = ClientPublishingSetting.new(client_publishing_setting_params)

    respond_to do |format|
      if @client_publishing_setting.save
        format.html { redirect_to @client_publishing_setting, notice: 'Client publishing setting was successfully created.' }
        format.json { render :show, status: :created, location: @client_publishing_setting }
      else
        format.html { render :new }
        format.json { render json: @client_publishing_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_publishing_settings/1
  # PATCH/PUT /client_publishing_settings/1.json
  def update
    respond_to do |format|
      if @client_publishing_setting.update(client_publishing_setting_params)
        format.html { redirect_to @client_publishing_setting, notice: 'Client publishing setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_publishing_setting }
      else
        format.html { render :edit }
        format.json { render json: @client_publishing_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_publishing_settings/1
  # DELETE /client_publishing_settings/1.json
  def destroy
    @client_publishing_setting.destroy
    respond_to do |format|
      format.html { redirect_to client_publishing_settings_url, notice: 'Client publishing setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_publishing_setting
      @client_publishing_setting = ClientPublishingSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_publishing_setting_params
      params.require(:client_publishing_setting).permit(:client_id, :comment)
    end
end
