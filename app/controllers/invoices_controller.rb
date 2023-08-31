class InvoicesController < ApplicationController
  # before_action :authenticate_user!
  # def index
  #   @invoices = current_user.invoices.order(emission_date: :desc)
  #   if params[:query].present?
  #     sql_subquery = "number ILIKE :query "
  #     @invoices = @invoices.where(sql_subquery, query: "%#{params[:query]}%")
  #   end
  # end
  def index
    @invoices = current_user.invoices.order(emission_date: :desc)
    if params[:query].present?
      sql_subquery_number = "number ILIKE :query"
      sql_subquery_company = "debtors.company_name ILIKE :query"
      search_column = params[:search_by] == 'number' ? sql_subquery_number : sql_subquery_company
      @invoices = @invoices.joins(relationship: :debtor).where(search_column, query: "%#{params[:query]}%")
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
    @relationship = Relationship.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @debtor = Debtor.find_by(siren: params[:invoice][:siren])
    @debtor ||= Debtor.create(siren: params[:invoice][:siren], company_name: "Entreprise à créer")
    @relationship = Relationship.find_or_initialize_by(debtor: @debtor, user: current_user)
    @relationship.save
    @invoice.relationship = @relationship
    if @invoice.save
      redirect_to invoices_path
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    @invoice.payment_date? @invoice.progress = "Payée"
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      raise
      render :edit, status: :unprocessable_entity
    end
  end

  def archives
    @invoices = current_user.invoices.order(emission_date: :desc)
    @invoices_paid = @invoices.where(progress: "Payée")
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :emission_date, :due_date, :comment, :progress, :relationship_id, :file)
  end
end
