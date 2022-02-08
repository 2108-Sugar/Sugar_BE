class RequestSerializer
  include JSONAPI::Serializer
  attributes :name, :details, :item_category, :status, :requested_by_id, :lender_id, :community_id, :created_at, :updated_at

  attributes :borrow_date do |object|
    object.borrow_date.strftime("%m-%d-%y")
  end

  attributes :return_date do |object|
    object.return_date.strftime("%m-%d-%y")
  end

  attributes :created_at do |object|
    object.created_at.strftime("%m-%d-%y %H:%m")
  end

  attributes :updated_at do |object|
    object.updated_at.strftime("%m-%d-%y %H:%m")
  end

end
