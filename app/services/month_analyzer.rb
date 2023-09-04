class MonthAnalyzer
  def initialize(user, month, year)
    @user = user
    @month = month
    @year = year
  end

  def get_invoices_by_month
    @invoices = @user.invoices.where.not(payment_date: nil).where('extract(month from due_date) = ? AND extract(year from due_date) = ?', @month, @year)
  end
end
