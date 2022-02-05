class User < ApplicationRecord
  has_many :requested_by_requests, class_name: 'Request', foreign_key: 'requested_by_id'
  has_many :lender_requests, class_name: 'Request', foreign_key: 'lender_id'
  belongs_to :community

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  # validates :password_digest, presence: true
  validates :community_id, presence: true, numericality: true
  # validates :password_confirmation, presence: true
  #
  # has_secure_password
end
