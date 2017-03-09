class UpdateMenuItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :menu_items, :veg
    add_column :menu_items, :logo, :string
    add_column :menu_items, :available, :boolean, default: false
  end
end
