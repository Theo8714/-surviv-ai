class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :debtor
  has_many :invoices

  def calculate_average_rating(average_days)
    case average_days
      when 0
        self.rating = 5
      when 1..4
        self.rating = 4
      when 5..13
        self.rating = 3
      when 14..29
        self.rating = 2
      else
        self.rating = 1
    end
    self.save
  end
end
