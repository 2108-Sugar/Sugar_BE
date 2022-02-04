class AddNameToCommunity < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :name, :string
  end
end
