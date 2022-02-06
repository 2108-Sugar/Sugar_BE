class RequestSerializer
  include JSONAPI::Serializer
  attributes :name, :details, :item_category, :status, :borrow_date, :return_date, :requested_by_id, :lender_id, :community_id
end
