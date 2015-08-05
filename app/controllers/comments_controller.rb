class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    @comment.save
    redirect_to game_path(comment_params.game_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:id, :body, :game_id, :user_id)
    end

end
