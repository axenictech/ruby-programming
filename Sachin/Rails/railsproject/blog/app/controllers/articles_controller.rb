class ArticlesController < ApplicationController


  def new
    @article=Article.new
    @articles= Article.all
  end
	def show
  	@articles = Article.all
  	@article = Article.find(params[:id])
  end

	def create
    @articles= Article.all
		@article = Article.new(article_params)
 		if @article.save
  	  redirect_to new_article_path
      else
      render 'new'
    end
  end

  def edit
      
 		@article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to new_article_path
  end
  	
  def update
  	@article = Article.find(params[:id])
    @article.update(article_params)
 	  redirect_to new_article_path
	end

	private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
