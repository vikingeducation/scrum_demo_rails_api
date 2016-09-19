class CommentsController < ApplicationController
  def create
    @comment = parent_post.comments.build(comment_params)

    unless @comment.save
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end

    respond_to :js
  end

  def destroy
    @comment = parent_post.comments.find(params[:id])
    @comment.destroy
    render json: { comment: { id: @comment.id } }
  end

  private

  def parent_post
    @parent_post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
