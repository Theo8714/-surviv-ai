class DebtorAnalyzer
  def initialize(relationship)
    @debtor = relationship.debtor
    @user = relationship.user
    @invoices = relationship.invoices
  end

  # def perform
  #   average_invoice_amount
  #   total_unpaid_amount
  # end

  def average_invoice_amount
    total_amount = @invoices.sum(:amount)
    @average = invoices.count.positive? ? total_amount / invoices.count : 0
  end

  def total_unpaid_amount
    unpaid_invoices = @invoices.where(progress: "Phase amiable")
    @unpaid_amount = unpaid_invoices.sum(:amount)
  end
end
