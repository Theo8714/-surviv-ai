class Reminder < ApplicationRecord
  REMINDERTYPES = %w[email téléphone lettre]
  belongs_to :invoice
  validates :reminder_type, :action_date, :progress, presence: true
  validates :reminder_type, inclusion: { in: REMINDERTYPES }

  def self.total_reminders_by_month
    start_date = Date.today - Date.today.day + 1
    end_date = Date.today
    reminders = Reminder.where(action_date: start_date..end_date).count
  end
end
