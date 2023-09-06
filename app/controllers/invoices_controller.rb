require 'mindee'
require 'open-uri'

class InvoicesController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:incoming_invoice]
  skip_before_action :authenticate_user!, only: [:incoming_invoice]

  def index
    @invoices = current_user.invoices.order(created_at: :desc)
    # if params[:query].present?
    #   sql_subquery_number = "number ILIKE :query"
    #   sql_subquery_company = "debtors.company_name ILIKE :query"
    #   search_column = params[:search_by] == 'number' ? sql_subquery_number : sql_subquery_company
    #   @invoices = @invoices.joins(relationship: :debtor).where(search_column, query: "%#{params[:query]}%")
    # end
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @invoices = @invoices.joins(relationship: :debtor).where("number ILIKE :query OR debtors.company_name ILIKE :query", query: search_query)
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
    @mindee = MindeeExtractor.new
  end

  def create
    @mindee = MindeeExtractor.new(params[:invoice][:file].tempfile.path)
    @mindee.perform
    extractor_hash = @mindee.extractor_hash

    @debtor = Debtor.find_by(company_name: extractor_hash[:company_name])
    @debtor ||= Debtor.create(company_name: extractor_hash[:company_name])
    @relationship = Relationship.find_or_initialize_by(debtor: @debtor, user: current_user)
    @relationship.save

    @invoice = Invoice.new(
      number: extractor_hash[:number],
      amount: extractor_hash[:amount],
      emission_date: extractor_hash[:emission_date],
      due_date: extractor_hash[:due_date],
      progress: "À traiter"
    )

    @invoice.file = invoice_params[:file]
    @invoice.relationship = @relationship

    if @invoice.save
      redirect_to invoices_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    @invoice.progress = "Payé" if @invoice.payment_date?
    if @invoice.save
      flash[:notice] = "La facture a bien été modifiée en payée"
      redirect_to archives_invoices_path
    else
      render :edit, status: :unprocessable_entity
    end
    @invoice.relationship.calculate_payment_days
  end

  def archives
    @invoices = current_user.invoices.order(emission_date: :desc)
    @invoices_paid = @invoices.where(progress: "Payé")
    @invoices_paid.each do |invoice|
      invoice.calculate_average_days_late
    end
  end

  def incoming_invoice
    puts "---------"
    puts params
    puts "---------"
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :emission_date, :siren, :due_date, :comment, :progress, :relationship_id, :file, :payment_date)
  end

end
