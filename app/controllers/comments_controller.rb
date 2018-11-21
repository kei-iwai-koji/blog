class CommentsController < ApplicationController
  def create
    @comment = Comment.create(name: comment_params[:name], text: comment_params[:text])
    redirect_to "/blog"
  end

  private
  def comment_params
    paramas_permit(:name, :text)
  end
end
