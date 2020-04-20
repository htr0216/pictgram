class CommentsController < ApplicationController
  def new
   @comment = Comment.new
  end
  
  def create
    topic_id = params[:comment][:topic_id].to_i
    comment = Comment.new
    comment.topic_id = topic_id
    comment.content = params[:comment][:content]
    comment.user_id = current_user.id
    #binding.pry

    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: topic_url(topic_id))
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: topic_url(topic_id))
    end
  end

=begin  def destroy
    image = Topic.find(params[:topic_id])
    @comment = topic.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: topic_path(image))
  end
=end  
end

