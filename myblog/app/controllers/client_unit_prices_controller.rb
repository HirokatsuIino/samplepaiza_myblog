class ClientUnitPricesController < ApplicationController
  before_action :set_client_unit_price, only: [:show, :edit, :update, :destroy]

  # GET /client_unit_prices
  # GET /client_unit_prices.json
  def index
    @client_unit_prices = ClientUnitPrice.all
  end

  # GET /client_unit_prices/1
  # GET /client_unit_prices/1.json
  def show
  end

  # GET /client_unit_prices/new
  def new
    @client_unit_price = ClientUnitPrice.new
  end

  # GET /client_unit_prices/1/edit
  def edit
  end

  # POST /client_unit_prices
  # POST /client_unit_prices.json
  def create
    @client_unit_price = ClientUnitPrice.new(client_unit_price_params)

    respond_to do |format|
      if @client_unit_price.save
        format.html { redirect_to @client_unit_price, notice: 'Client unit price was successfully created.' }
        format.json { render :show, status: :created, location: @client_unit_price }
      else
        format.html { render :new }
        format.json { render json: @client_unit_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_unit_prices/1
  # PATCH/PUT /client_unit_prices/1.json
  def update
    respond_to do |format|
      if @client_unit_price.update(client_unit_price_params)
        format.html { redirect_to @client_unit_price, notice: 'Client unit price was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_unit_price }
      else
        format.html { render :edit }
        format.json { render json: @client_unit_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_unit_prices/1
  # DELETE /client_unit_prices/1.json
  def destroy
    @client_unit_price.destroy
    respond_to do |format|
      format.html { redirect_to client_unit_prices_url, notice: 'Client unit price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_unit_price
      @client_unit_price = ClientUnitPrice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_unit_price_params
      params.require(:client_unit_price).permit(:client_id, :unit_price_id, :begin_at)
    end
end
