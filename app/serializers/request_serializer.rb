class RequestSerializer
  include JSONAPI::Serializer
  attributes :name, :details, :item_category, :status, :requested_by_id, :lender_id, :community_id, :created_at, :updated_at

  attributes :borrow_date do |object|
    object.borrow_date.strftime("%m-%d-%y")
  end
  attributes :return_date do |object|
    object.return_date.strftime("%m-%d-%y")
  end
  #we can parse timestamps similarly if FE needs
end
