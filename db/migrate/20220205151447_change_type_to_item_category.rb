class ChangeTypeToItemCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :type, :item_category
  end
end
