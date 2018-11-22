class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.includes(:user)
  end

  def new
  end

  def create
    Article.create(title: article_params[:title],article: article_params[:article])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user.id == current_user.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user.id == current_user.id
      article.update(article_params)
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
  end

  private
  def article_params
    paramas_permit(:title, :article)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
