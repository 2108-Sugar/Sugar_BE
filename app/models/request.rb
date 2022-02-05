class Request < ApplicationRecord
  belongs_to :requested_by, class_name: 'User'
  belongs_to :lender, class_name: 'User', optional: true

  belongs_to :community
end
