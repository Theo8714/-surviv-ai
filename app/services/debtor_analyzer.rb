class DebtorAnalyzer
  attr_reader :debtor, :unpaid_amount, :total_invoices_amount, :overdue_invoices_count, :reminders_sent

  def initialize(relationship)
    @debtor = relationship.debtor
    @user = relationship.user
    @invoices = relationship.invoices
  end

  def perform
    # calculate_average_invoice_amount
    calculate_total_unpaid_amount
    calculate_total_invoices_amount
    calculate_overdue_invoices_count
    total_reminders_sent
  end

  private

  def calculate_total_invoices_amount
    @total_invoices_amount = @invoices.sum(:amount)
  end

  # def calculate_average_invoice_amount
  #   total_amount = @invoices.sum(:amount)
  #   @average = @invoices.count.positive? ? total_amount / @invoices.count : 0
  # end

  def calculate_total_unpaid_amount
    unpaid_invoices = @invoices.where(progress: ["Phase amiable", "Juridique"])
    @unpaid_amount = unpaid_invoices.sum(:amount)
  end

  def calculate_overdue_invoices_count
    @overdue_invoices_count = @invoices.where("due_date < ? AND progress = ?", Date.today, "Phase amiable").count
  end

  def total_reminders_sent
    @reminders_sent = @invoices.joins(:reminders).count
  end
end
