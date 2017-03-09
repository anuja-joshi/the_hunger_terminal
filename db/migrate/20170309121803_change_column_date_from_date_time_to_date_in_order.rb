class ChangeColumnDateFromDateTimeToDateInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :date, :date 
  end
end
