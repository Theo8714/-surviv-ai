class Invoice < ApplicationRecord
  before_validation :set_progress, on: :create

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
    self.progress == "" ? self.progress = "À traiter" : self.progress
  end
end
