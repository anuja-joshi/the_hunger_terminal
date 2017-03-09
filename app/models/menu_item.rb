class MenuItem < ApplicationRecord
  belongs_to :terminal, inverse_of: :menu_items

  validates :name, presence: true, uniqueness: { scope: :terminal_id, case_sensitive: false }
  validates :price, numericality: { greater_than: 0 }
end
