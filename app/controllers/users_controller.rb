class UsersController < ApplicationController
  before_action :load_company 
  def index
    @users = @company.users
  end

  private

  def load_company
    @company = Company.find(params[:company_id])
  end
end
