class Debtor < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :users, through: :invoices
  has_many :reminders, through: :invoices
  has_many :relationships
  has_many :users, through: :relationships
  validates :company_name, :siren, presence: true
  validates :siren, uniqueness: true
  validates :siren, length: { is: 9 }
end
