FactoryGirl.define do
  factory :ledger do
    terminal nil
    date "2017-03-09"
    orders_count 1
    orders_amount 1.5
    balance 1.5
    discount 1.5
    transaction_type "MyString"
  end
end
