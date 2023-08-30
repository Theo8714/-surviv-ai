class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :debtor
  has_many :invoices
end
