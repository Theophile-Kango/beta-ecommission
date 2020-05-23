class CommentsController < ApplicationController
    before_action :user_authorization, only: %i[destroy edit update]

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(params_comment)
        if @comment.save
            redirect_to @article
        else
            redirect_to @article
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash.alert = 'comment, deleted!'
        redirect_to @article
    end

    private
    def params_comment
        params.require(:comment).permit(:body, :user_id)
    end

    def user_authorization
        return if current_user.comments.find_by_id(params[:id])
        flash.alert = 'authorize author only'
        redirect_to :root
    end
end
