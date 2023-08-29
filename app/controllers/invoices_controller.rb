class InvoicesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @invoices = current_user.invoices.order(emission_date: :desc)
    if params[:query].present?
      sql_subquery = "number ILIKE :query "
      @invoices = @invoices.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @invoice = Invoice.find(params[:id])

  end

  def new
    @invoice = Invoice.new
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

  # def edit
  #   @invoice = Invoice.find(params[:id])
  #   @user = User.find(params[:user_id])
  # end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :emission_date, :payment_date, :comment, :progress, :debtor_id)
  end
end
