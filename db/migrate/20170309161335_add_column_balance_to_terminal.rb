class AddColumnBalanceToTerminal < ActiveRecord::Migration[5.0]
  def change
    add_column :terminals, :balance, :float, default: 0
  end
end