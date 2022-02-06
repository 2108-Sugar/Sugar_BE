class ChangeBorrowDateToBeDateInRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :borrow_date, :date
    change_column :requests, :return_date, :date
  end
end
