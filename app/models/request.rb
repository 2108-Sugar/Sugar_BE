class Request < ApplicationRecord
  belongs_to :requested_by, class_name: 'User'
  belongs_to :lender, class_name: 'User', optional: true
  belongs_to :community

  validates :name, presence: true
  validates :details, presence: true
  validates :item_category, presence: true
  validates :status, presence: true
  validates :borrow_date, presence: true
  validates :return_date, presence: true
  validates :requested_by_id, presence: true, numericality: true
  validates :community_id, presence: true, numericality: true

  enum status: {
    unassigned: 0,
    assigned: 1,
    archived: 2
  }
end
