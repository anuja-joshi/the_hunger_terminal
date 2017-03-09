class Ledger < ApplicationRecord
  TransactionTypes = { debit: 'debit', credit: 'credit' }

  belongs_to :terminal

  validates :transaction_type, inclusion: { in: TransactionTypes.values,
    message: "%{value} is not included in #{TransactionTypes.values.join(', ')}" }
end
