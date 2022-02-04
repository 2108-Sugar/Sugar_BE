class AddCommunityIdToRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :requests, :community, null: false, foreign_key: true
  end
end
