class AddCommunityIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :community, null: false, foreign_key: true
  end
end
