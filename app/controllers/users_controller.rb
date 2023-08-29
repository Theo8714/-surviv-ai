class UsersController < ApplicationController
  def show
    @invoices = current_user.invoices
    @user = User.find(params[:id])
  end
end
