class CommentsController < ApplicationController
  before_action :set_article

  def create
    @article.comments.create! params.required(:comment).permit(:content)
    redirect_to @article
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end
end
