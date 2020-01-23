class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = current_user.comments.new(params_comment)
    
    #@comment = Comment.new(params_comment)
   # @comment.user_id = current_user.id
   
    # @comment.description = params[:comment]
    
    if @comment.save
      redirect_to topics_path, success:"コメントを投稿しました。"
    else
      Rails.logger.info(@comment.errors.inspect)
      flash.now[:danger] = "コメント投稿に失敗しました。"
      render :new
    end
  end
  
  
  
  
  private
  def params_comment
    params.require(:comment).permit(:description, :topic_id)
  end
  
  
end
