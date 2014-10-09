class ArticalsController < ApplicationController
	def index
		@articals=Artical.all
	end
	def new
	@artical=Artical.new
	end
	def create
		@artical=Artical.new(params_article)
		@artical.save
		redirect_to articals_path(@artical)
	end

	def show
		@artical=Artical.find([:id])
		
	end

	private
	def params_article
	params.require(:artical).permit(:title, :text)	
	end
end
