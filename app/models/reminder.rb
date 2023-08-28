class Reminder < ApplicationRecord
  REMINDERTYPES = %w[email téléphone lettre]
  belongs_to :invoice
  validates :reminder_type, :action_date, :progress, presence: true
  validates :reminder_type, inclusion: { in: REMINDERTYPES }
end
