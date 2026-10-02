class LikesController < ApplicationController
  def like_post(user_id, post_id)
    like_post = Like.new(user_id: user_id, post_id: post_id)
    like_post
  end
end
