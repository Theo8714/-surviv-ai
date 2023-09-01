class Invoice < ApplicationRecord
  before_validation :set_progress, on: :create
  attr_reader :siren

  PROGRESS = ["À traiter", "Avant échéance", "Phase amiable", "Juridique", "Payé"]
  belongs_to :relationship
  has_one :user, through: :relationship
  has_one :debtor, through: :relationship
  has_many :reminders

  validates :number, :amount, :emission_date, :due_date, presence: true
  validates :progress, inclusion: { in: PROGRESS }
  has_one_attached :file
  # validates :number, uniqueness: true

  def set_progress
    if self.progress.nil?
      self.progress = "À traiter"
    end
  end

  def calculate_average_days_late
    total_days = 0
    valid_invoices_count = 0
    unless self.payment_date.nil?
      days_until_paid = (self.payment_date - self.due_date)
      if days_until_paid.positive?
        total_days += days_until_paid
        valid_invoices_count += 1
      end
    end
    average_days = valid_invoices_count.positive? ? total_days.to_f / valid_invoices_count : 0
    self.relationship.payment_days = average_days
    self.relationship.save
    self.relationship.calculate_average_rating(average_days)
  end
end
