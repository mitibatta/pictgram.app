class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params_comment)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    # @comment.description = params[:comment]
    
    if @comment.save
      redirect_to topics_path, success:"コメントを投稿しました。"
    else
      flash.now[:danger] = "コメント投稿に失敗しました。"
      render :new
    end
  end
  
  
  
  
  private
  def params_comment
    params.require(:comment).permit(:description)
  end
  
  
end
