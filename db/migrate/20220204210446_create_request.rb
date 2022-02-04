class CreateRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :details
      t.string :type
      t.integer :status
      t.datetime :borrow_date
      t.datetime :return_date
      t.references :requested_by
      t.references :lender

      t.timestamps
    end

    add_foreign_key :requests, :users, column: :requested_by_id
    add_foreign_key :requests, :users, column: :lender_id
  end
end
