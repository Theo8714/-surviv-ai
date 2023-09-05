class MonthAnalyzer
  def initialize(user, month, year)
    @user = user
    @month = month
    @year = year
  end

  def perform
    get_invoices_by_month
    calculate_average_payment_days_by_month
  end

  private

  def get_invoices_by_month
    @invoices = @user.invoices.where.not(payment_date: nil).where('extract(month from due_date) = ? AND extract(year from due_date) = ?', @month, @year)
  end

  def calculate_average_payment_days_by_month
    total_days = 0
    valid_invoices_count = 0
    paid_invoices = @invoices.where.not(payment_date: nil)
    paid_invoices.each do |invoice|
      days = (invoice.payment_date - invoice.due_date).to_i
      total_days += days
      valid_invoices_count += 1
    end
    average_payment_days = valid_invoices_count > 0 ? total_days / valid_invoices_count.to_f : 0

    return average_payment_days
  end
end
