class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  def new
    @friend_request = FriendRequent.new
  end

  def create
    @friend_request = FriendRequest.create(request_params)
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
  end

  def accept
  end


  def decline
  end

  private
  def request_params
    params.require(:sender_id, :recipient_id, :status)
  end
end
