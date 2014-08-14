class CommentsController < ApplicationController
 
http_basic_authenticate_with name: "rails ", password: "123", only: :destroy

 def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(params_comment)
  redirect_to article_path(@article)
 end
 
 def destroy
 	@article =Article.find(params[:article_id])
    @comment =@article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
end

 private
   def params_comment
    params.require(:comment).permit(:commenter,  :body)
   end
  end    