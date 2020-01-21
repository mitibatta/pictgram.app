class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def index
    @topics = Topic.all
  end
  
  def create
    @topic = current_user.topics.new(params_topic)
    
    if @topic.save
      redirect_to topics_path, success: "投稿に成功しました。"
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
    
  end
  
  private
  def params_topic
    params.require(:topic).permit(:description, :image)
  end
end
