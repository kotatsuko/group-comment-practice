class CommentsController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.group_id = group.id
    comment.save
    redirect_to group_path(group)
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
