class User < ApplicationRecord
  has_many :requested_by_requests, class_name: 'Request', foreign_key: 'requested_by_id'
  has_many :lender_requests, class_name: 'Request', foreign_key: 'lender_id'

  belongs_to :community
end
