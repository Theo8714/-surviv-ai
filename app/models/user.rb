class User < ApplicationRecord
  has_many :relationships
  has_many :invoices, through: :relationships
  has_many :debtors, through: :relationships
  has_many :reminders, through: :invoices
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
