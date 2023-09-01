class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :debtor
  has_many :invoices

  def calculate_average_rating(average_days)
    case average_days
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
