class Api::V1::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index

    @clients = Client.all
    # ClientPublishingSetting.all
    # ClientPublishingSetting.joins(:client_id)

    # Client.joins(:client_publishing_setting)
    # client_publishing_setting
    # posts_needed = Client.joins(:client)
    #                    .select("
    #   posts.id,
    #   posts.name,
    #   description, #ここはusersテーブルと名前が被らない
    #   user_id, #ここはusersテーブルと名前が被らない
    #   users.name AS user_name #別名を付けられる
    #   ")
    # render json: posts_needed

    # @clients = Client.joins(:client_publishing_setting)

    # @clients = Client.all
    # @clients_publish = ClientPublishingSetting.all
    # @clients = Client.where(client_id: @clients_publish)


    # @c = Client.all
    # @clients = ClientPublishingSetting.where(client_id: @c.client_id)


    # @clients = Client.all
    render json: @clients
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    Client.joins(:client_publishing_setting).select("clients.id", "client_publishing_settings.comment AS c_name").limit(1)
    render json: @client
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:id, :client_id, :name, :admin_comment, :area_important, :nav_id)
    end


    def client_needed
      client_needed = Client.joins(:client_publishing_setting).select("clients.*,client_publishing_settings.name AS c_name")
      render json: client_needed
    end
end
