class Invoice < ApplicationRecord
  before_validation :set_progress, on: :create

  PROGRESS = ["À traiter", "Avant échéance", "Phase amiable", "Juridique", "Payé"]
  belongs_to :user
  belongs_to :debtor
  has_many :reminders
  validates :number, :amount, :emission_date, :payment_date, presence: true
  validates :progress, inclusion: { in: PROGRESS }
  # validates :number, uniqueness: true

  def set_progress
    self.progress = "À traiter"
  end
end
