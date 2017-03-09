class Terminal < ApplicationRecord
  has_many :ledgers
  has_many :order_details
  has_many :menu_items, inverse_of: :terminal
  
  belongs_to :company

  accepts_nested_attributes_for :menu_items, allow_destroy: true, reject_if: :blank_menu

  validates :name, presence: true, uniqueness: { scope: :company_id, case_sensitive: false }
  validates :landline, presence: true, uniqueness: { scope: :company_id } #TODO regular expr validation
  validates :tax, numericality: { greater_than_or_equal_to: 0, less_than: 100 }
  validates :delivery_charges, numericality: { greater_than_or_equal_to: 0 }
  validates :minimum_delivery, numericality: { greater_than_or_equal_to: 0 }
  validates :email, allow_blank: true, uniqueness: { scope: :company_id }, 
    format: { with: Devise.email_regexp, message: "Invalid email format"}

  private

  # TODO reject the menu if name and price are blank
  def blank_menu
    if attributes[:name].blank? || attributes[:price].blank?
      if attributes[:id].present?
        attributes.merge!({:_destroy => 1}) && false
      else
        true
      end
    end
  end
end
