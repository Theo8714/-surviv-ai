class Invoice < ApplicationRecord
  PROGRESS = ["À traiter", "Avant échéance", "Phase amiable", "Juridique", "Payé"]
  belongs_to :user
  belongs_to :debtor
  has_many :reminders
  validates :number, :amount, :emission_date, :payment_date, presence: true
  validates :progress, inclusion: { in: PROGRESS }
  has_one_attached :attachment
  # validates :number, uniqueness: true
end
