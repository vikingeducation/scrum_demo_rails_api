class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    unless @post.save
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end

    respond_to :js
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
