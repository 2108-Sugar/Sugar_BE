class RemoveRequestFromCommunity < ActiveRecord::Migration[6.1]
  def change
    remove_reference :communities, :request, null: false, foreign_key: true
  end
end
