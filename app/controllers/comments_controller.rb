class CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comments = @comment.flower.comments
    @comment.destroy
  end
end
