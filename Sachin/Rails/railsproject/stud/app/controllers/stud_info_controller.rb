class StudInfoController < ApplicationController


  def index
  end
  def create
  	 @article = StudentD.new(params[:article])
 
  @article.save
  redirect_to @article
  end
end
