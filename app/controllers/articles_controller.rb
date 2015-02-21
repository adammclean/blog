class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  #render method with key=>plain; value=>params[:article].inspect
  #params method is an object
  def create
  	#We define article_params in 'private'
  	@article = Article.new(article_params)
  		
  	if @article.save
  	 redirect_to new_article_path

  	else
  		render 'new'
  	end
  end
  
  private
  	def article_params
  		params.require(:article).permit(:title, :text)
		end
end
