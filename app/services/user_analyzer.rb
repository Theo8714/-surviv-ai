class UserDashboardAnalyzer
  attr_reader :total_invoices_amount, :total_unpaid_amount, :average_invoice_amount, :overdue_invoices_count

  def initialize(user)
    @user = user
  end

  def perform
    calculate_total_invoices_amount
    calculate_total_unpaid_amount
    calculate_average_invoice_amount
    calculate_overdue_invoices_count
  end

  def calculate_total_invoices_amount
    @total_invoices_amount = @user.invoices.sum(:amount)
  end

  def calculate_total_unpaid_amount
    @total_unpaid_amount = @user.invoices.where(progress: "Phase amiable").sum(:amount)
  end

  def calculate_average_invoice_amount
    total_amount = @user.invoices.sum(:amount)
    @average_invoice_amount = @user.invoices.count.positive? ? total_amount / @user.invoices.count : 0
  end

  def calculate_overdue_invoices_count
    @overdue_invoices_count = @user.invoices.where("due_date < ? AND progress = ?", Date.today, "Phase amiable").count
  end
end
