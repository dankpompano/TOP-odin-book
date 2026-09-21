class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all

    if params[:send_request].present?

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

  protected
  def send_request(recipient_id, sender_id)
    @friend_request = FriendRequest.new(sender_id: sender_id, recipient_id: recipient_id, status: "Sent")
  end

  def accept(recipient_id, sender_id)
    @friend_request = FriendRequest.find(params[sender_id: sender_id, recipient_id: recipient_id])
    @friend_request = FriendRequest.update(status: "Accepted")
  end


  def decline(recipient_id, sender_id)
    @friend_request = FriendRequest.find(params[sender_id: sender_id, recipient_id: recipient_id])
    @friend_request = FriendRequest.update(status: "Decline")
  end

  private
  def request_params
    params.require(:sender_id, :recipient_id, :status)
  end
end
