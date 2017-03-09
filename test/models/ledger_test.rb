require "test_helper"

describe Ledger do
  let(:ledger) { Ledger.new }

  it "must be valid" do
    value(ledger).must_be :valid?
  end
end
