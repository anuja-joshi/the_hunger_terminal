class CreateLedgers < ActiveRecord::Migration[5.0]
  def change
    create_table :ledgers do |t|
      t.references :terminal, foreign_key: true
      t.date :date
      t.integer :orders_count
      t.float :orders_amount
      t.float :balance
      t.float :discount
      t.string :transaction_type

      t.timestamps
    end
  end
end
