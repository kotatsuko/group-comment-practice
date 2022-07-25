class CommentsController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.group_id = group.id
    if @comment.save
      ActionCable.server.broadcast 'group_channel', comment: @comment.template
    else
      render "groups/show"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
