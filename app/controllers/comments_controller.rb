class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end

  def create
    @comment = current_user.comments.new(comment_params)
  if @comment.save
    redirect_to topics_path
  else
    flash.now[:alert] = "コメントを入力してください"
    render :new
  end
end

private
 def comment_params
  params.require(:comment).permit(:body,:topic_id)
 end
end
