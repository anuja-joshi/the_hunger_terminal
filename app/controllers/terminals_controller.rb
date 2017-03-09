class TerminalsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_company
  before_action :load_terminal, only: [:show, :edit, :update, :destroy]

  def index
    @terminals = @current_company.terminals.page params[:page]
  end

  def new
    @terminal = @current_company.terminals.build
  end

  def show
    @menu_items = @terminal.menu_items
  end

  def create
    @terminal = @current_company.terminals.build terminal_params
    if @terminal.save
      flash[:success] = "terminal created successfully"
      redirect_to terminals_path and return
    end
    render :new
  end

  def edit
  end

  def update
    if @terminal.update terminal_params
      flash[:success] = "terminal updated successfully"
      redirect_to terminals_path and return
    end
    render :edit
  end

  def destroy
    @terminal.destroy
    flash[:success] = "terminal deleted successfully"
    redirect_to terminals_path
  end

  private

  def load_company
    @current_company = current_user.company
    unless @current_company
      flash[:warning] = 'Company not found'
      redirect_to root_path and return
    end
  end

  def load_terminal
    @terminal = @current_company.terminals.find params[:id]
    unless @terminal
      flash[:warning] = 'Terminal not found'
      redirect_to terminals_path and return
    end
  end

  def terminal_params
    params.require(:terminal).permit(:name, :email, :landline, :tax, :delivery_charges, :minimum_delivery, :active,
                                     menu_items_attributes: [:name, :price, :visibility, :_destroy, :id])
  end
end
