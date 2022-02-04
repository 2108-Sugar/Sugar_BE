class RemoveUserFromCommunity < ActiveRecord::Migration[6.1]
  def change
    remove_reference :communities, :user, null: false, foreign_key: true
  end
end
