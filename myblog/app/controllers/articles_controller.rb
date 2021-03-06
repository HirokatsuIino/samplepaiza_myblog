class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  protect_from_forgery :except => [:create]

  # GET /articles
  # GET /articles.json
  def index
    if params[:name_key]
      @articles = Article.where('content LIKE ?', "%#{params[:name_key]}%")
    else
      @articles = Article.all
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    # @article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    if user_signed_in?
      @article.user_id = current_user.id
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.user_id == current_user.id
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @article, notice: "You don't have permission."
    end



  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      msg = "Article was successfully destroyed."
    else
      msg = "You don't have permission."
    end
    respond_to do |format|
      format.html { redirect_to articles_url, notice: msg }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      # @article = Article.all
      @article = Article.find(params[:id])
      puts @article
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:content, :name, :feeling)
    end
end
