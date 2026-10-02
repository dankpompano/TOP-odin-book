class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.new
    @feed = Post.all
  end

  def like_post(user_id, post_id)
    like_post = Like.new(user_id: user_id, post_id: post_id)
    like_post
  end
end
