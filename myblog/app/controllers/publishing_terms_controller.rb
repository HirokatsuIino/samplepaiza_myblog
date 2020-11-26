class PublishingTermsController < ApplicationController
  before_action :set_publishing_term, only: [:show, :edit, :update, :destroy]

  # GET /publishing_terms
  # GET /publishing_terms.json
  def index
    @publishing_terms = PublishingTerm.all
  end

  # GET /publishing_terms/1
  # GET /publishing_terms/1.json
  def show
  end

  # GET /publishing_terms/new
  def new
    @publishing_term = PublishingTerm.new
  end

  # GET /publishing_terms/1/edit
  def edit
  end

  # POST /publishing_terms
  # POST /publishing_terms.json
  def create
    @publishing_term = PublishingTerm.new(publishing_term_params)

    respond_to do |format|
      if @publishing_term.save
        format.html { redirect_to @publishing_term, notice: 'Publishing term was successfully created.' }
        format.json { render :show, status: :created, location: @publishing_term }
      else
        format.html { render :new }
        format.json { render json: @publishing_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishing_terms/1
  # PATCH/PUT /publishing_terms/1.json
  def update
    respond_to do |format|
      if @publishing_term.update(publishing_term_params)
        format.html { redirect_to @publishing_term, notice: 'Publishing term was successfully updated.' }
        format.json { render :show, status: :ok, location: @publishing_term }
      else
        format.html { render :edit }
        format.json { render json: @publishing_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishing_terms/1
  # DELETE /publishing_terms/1.json
  def destroy
    @publishing_term.destroy
    respond_to do |format|
      format.html { redirect_to publishing_terms_url, notice: 'Publishing term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publishing_term
      @publishing_term = PublishingTerm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publishing_term_params
      params.require(:publishing_term).permit(:client_publishing_setting_id, :begin_at, :end_at, :flg)
    end
end
