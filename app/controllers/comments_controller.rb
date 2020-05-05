class CommentsController < ApplicationController
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
        redirect_to @article
    end

    private
    def params_comment
        params.require(:comment).permit(:body, :user_id)
    end
end
