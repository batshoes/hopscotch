class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :game_id, :user_id)
    end

end
