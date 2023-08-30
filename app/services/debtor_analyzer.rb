class DebtorAnalyzer
  attr_reader :debtor, :average, :unpaid_amount

  def initialize(relationship)
    @debtor = relationship.debtor
    @user = relationship.user
    @invoices = relationship.invoices
  end

  def perform
    calculate_average_invoice_amount
    calculate_total_unpaid_amount
  end

  private

  def calculate_average_invoice_amount
    total_amount = @invoices.sum(:amount)
    @average = @invoices.count.positive? ? total_amount / @invoices.count : 0
  end

  def calculate_total_unpaid_amount
    unpaid_invoices = @invoices.where(progress: "Phase amiable")
    @unpaid_amount = unpaid_invoices.sum(:amount)
  end
end
