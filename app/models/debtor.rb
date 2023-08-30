class Debtor < ApplicationRecord
  has_many :relationships
  has_many :invoices, through: :relationships
  has_many :users, through: :relationships
  has_many :reminders, through: :invoices

  validates :company_name, :siren, presence: true
  validates :siren, uniqueness: true
  validates :siren, length: { is: 9 }
end
