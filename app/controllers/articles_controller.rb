class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  def index
    @articulos = Article.all
  end
  def show
  end
  
  def new
  	@article = Article.new
  end

  def create
  	@article = current_user.articles.new(article_params)
    respond_to do |format|
	  	if @article.save
          format.html {redirect_to @article, notice: "Articulo #{@article.title} correctamente." }
	        format.json {render :show, status: :created, location: @article}
	    else
	        format.html {redirect_to :new }
	        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  

  def edit
  	
  end

  def destroy
  	@article.destroy
  	respond_to do |format|
      format.html { redirect_to articles_url, notice: 'ARTICULO DESTRUIDO.' }
      format.json { head :no_content }
    end
  end

  def update
  	respond_to do |format|
	  	if @article.update(article_params)
	        format.html {redirect_to @article, notice: "Articulo #{@article.title} Modificado." }
	        format.json { render :show, status: :ok, localition: @article } 
	    else
	        format.html { render :edit }
		    format.json { render json: @article.errors, status: :unprocessable_entity }
	  	end
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
  def set_article
      @article = Article.find(params[:id])
  end
end
