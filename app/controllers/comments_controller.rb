class CommentsController < ApplicationController
  def create
    @comment = Comment.create(name: comment_params[:name], text: comment_params[:text], article_id: comment_params[:article_id])
    redirect_to "/"
  end

  private
  def comment_params
    params.permit(:name, :text, :article_id)
  end
end
