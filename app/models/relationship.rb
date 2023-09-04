class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :debtor
  has_many :invoices

  def calculate_payment_days
    @total_days = 0
    @valid_invoices_count = 0
    self.invoices.each do |invoice|
      unless invoice.payment_date.nil?
        days_until_paid = (invoice.payment_date - invoice.due_date)
          @total_days += days_until_paid
          @valid_invoices_count += 1
      end
    end
    average_days = @valid_invoices_count.positive? ? @total_days.to_f / @valid_invoices_count : 0
    self.payment_days = average_days
    self.save
    self.calculate_average_rating
  end

  def calculate_average_rating
    case self.payment_days
      when 0..3
        self.rating = 5
      when 4..9
        self.rating = 4
      when 10..19
        self.rating = 3
      when 20..29
        self.rating = 2
      else
        self.rating = 1
    end
    self.save
  end
end
