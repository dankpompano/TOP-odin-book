class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true

  has_many :posts
  has_many :incoming_requests, class_name: "FriendRequest", foreign_key: "recipient_id", dependent: :destroy, inverse_of: "recipient"
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy, inverse_of: "sender"
end
