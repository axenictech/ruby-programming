class ArticlesController < ApplicationController
 	
 	def new
 		@article=Article.new
 		@articles=Article.all
  end

def create
	@articles=Article.all
@article=Article.new(params_article) 

@article.save
render 'show'
end

private
def params_article
	params.require(:article).permit(:title,:text)
end
 def show
 	@article =Article.find(params[:id])
 end
def index
	@articles =Article.all
end
end
 


