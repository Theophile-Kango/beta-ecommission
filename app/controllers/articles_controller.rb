class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index]
  before_action :user_authorization, only: %i[destroy edit update]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.where(is_available: true).order('created_at Desc')
    @firsts = @articles.limit(4)
    
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @comments = @article.comments
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

    @article = current_user.articles.new(article_params)

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
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :tag_list, :image)
    end

    def user_authorization
      return if current_user.articles.find_by_id(params[:id])
  
      flash.alert = 'authorize author only'
      redirect_to :root
    end

end
