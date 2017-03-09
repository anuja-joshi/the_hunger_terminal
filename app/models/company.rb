class Company < ApplicationRecord
  has_many :users
  has_many :terminals
  accepts_nested_attributes_for :users
  after_create :assign_role_for_admin



  private

  def assign_role_for_admin
    user = self.users.first
    user.update_attributes(
      role: "company_admin",
      active: true
    )
  end

end
