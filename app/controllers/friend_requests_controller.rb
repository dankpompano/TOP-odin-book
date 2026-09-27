class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friend_requests = FriendRequest.all

    if params[:username].present?
      user = User.find_by(username: params[:username])
      request = send_request(user.id, current_user.id)
      request.save
    end
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

  def send_request(recipient_id, sender_id)
    friend_request = FriendRequest.new(sender_id: sender_id, recipient_id: recipient_id, status: "Sent")
    friend_request
  end

  def accept
    friend_request = FriendRequest.find(params[:id])
    friend_request.update(status: "Accepted")
  end


  def decline
    friend_request = FriendRequest.find(params[:id])
    friend_request.update(status: "Declined")
  end

  private
  def request_params
    params.require(:friend_request).permit(:id, :sender_id, :recipient_id, :status)
  end
end
