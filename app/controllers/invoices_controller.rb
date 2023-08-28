class InvoicesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @invoices = Invoice.all.order(created_at: :desc)
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    @user = User.find(params[:user_id])
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = @user
    if @invoice.save
      redirect_to invoices_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :emission_date, :payment_date, :comment, :progress, :user_id, :debtor_id)
  end
end
