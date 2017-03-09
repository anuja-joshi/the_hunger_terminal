class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @company = Company.new
    @company.users.build
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "User signed up Successfully"
      sign_in @company.users.first
      redirect_to company_users_path(@company)
    else
      flash[:alert] = "Error in creating user"
      render 'new'
    end
  end


  private

  def company_params
    params.require(:company).permit( :name, :landline, users_attributes: [User.attribute_names, :password] )
  end
end
