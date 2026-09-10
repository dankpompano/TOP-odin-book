class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(posts_params)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def posts_params
    params.require(:body)
  end
end
