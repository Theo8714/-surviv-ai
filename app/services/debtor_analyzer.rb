class DebtorAnalyzer
  attr_reader :debtor, :unpaid_amount, :total_invoices_amount, :overdue_invoices_count, :reminders_sent, :average, :relationship, :average_days, :days

  def initialize(relationship)
    @debtor = relationship.debtor
    @user = relationship.user
    @invoices = relationship.invoices
    @relationship = relationship
  end

  def perform
    # calculate_average_invoice_amount
    calculate_total_unpaid_amount
    calculate_total_invoices_amount
    calculate_overdue_invoices_count
    total_reminders_sent
    average_days_late
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


  def calculate_average_rating(average_days)
    @rating = case average_days
              when 0
                @relationship.rating = 5
              when 1..4
                @relationship.rating = 4
              when 5..13
                @relationship.rating = 3
              when 14..29
                @relationship.rating = 2
              else
                @relationship.rating = 1
              end
    @relationship.save
  end

  def calculate_overdue_invoices_count
    @overdue_invoices_count = @invoices.where("due_date < ? AND progress = ?", Date.today, "Phase amiable").count
  end

  def total_reminders_sent
    @reminders_sent = @invoices.joins(:reminders).count
  end

  def average_days_late
    @invoices.each do |invoice|
      @days = invoice.relationship.payment_days
    end
  end
end
