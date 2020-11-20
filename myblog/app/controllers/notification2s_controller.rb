class Notification2sController < ApplicationController
  before_action :set_notification2, only: [:show, :edit, :update, :destroy]

  # GET /notification2s
  # GET /notification2s.json
  def index
    @notification2s = Notification2.all
    @now_date = Time.now
  end

  # GET /notification2s/1
  # GET /notification2s/1.json
  def show
  end

  # GET /notification2s/new
  def new
    @notification2 = Notification2.new
  end

  # GET /notification2s/1/edit
  def edit
  end

  # POST /notification2s
  # POST /notification2s.json
  def create
    @notification2 = Notification2.new(notification2_params)

    respond_to do |format|
      if @notification2.save
        format.html { redirect_to @notification2, notice: 'Notification2 was successfully created.' }
        format.json { render :show, status: :created, location: @notification2 }
      else
        format.html { render :new }
        format.json { render json: @notification2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification2s/1
  # PATCH/PUT /notification2s/1.json
  def update
    respond_to do |format|
      if @notification2.update(notification2_params)
        format.html { redirect_to @notification2, notice: 'Notification2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification2 }
      else
        format.html { render :edit }
        format.json { render json: @notification2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification2s/1
  # DELETE /notification2s/1.json
  def destroy
    @notification2.destroy
    respond_to do |format|
      format.html { redirect_to notification2s_url, notice: 'Notification2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification2
      @notification2 = Notification2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification2_params
      params.require(:notification2).permit(:title, :body, :begin_at, :end_at)
    end
end
