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
    @show_invoice = true
    @invoice = Invoice.find(params[:id])
  end

  def new
    @user = current_user
    @invoice = Invoice.new
    @debtor = Debtor.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    @debtor = Debtor.find_by(siren: params[:invoice][:siren])
    @debtor ||= Debtor.create(siren: params[:invoice][:siren], company_name: "Entreprise à créer")
    @invoice.debtor = @debtor
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
    params.require(:invoice).permit(:number, :amount, :emission_date, :due_date, :comment, :progress, :debtor_id, :file)
  end
end
