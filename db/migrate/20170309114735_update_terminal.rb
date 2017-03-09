class UpdateTerminal < ActiveRecord::Migration[5.0]
  def change
    change_column_default :terminals, :active, false
    add_column :terminals, :logo, :string
    add_column :terminals, :tax, :float, default: 0
    add_column :terminals, :email, :string
    add_column :terminals, :delivery_charges, :float, default: 0
    add_column :terminals, :minimum_delivery, :float, default: 0
  end
end
