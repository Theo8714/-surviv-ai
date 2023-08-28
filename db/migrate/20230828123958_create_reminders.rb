class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :reminder_type
      t.date :action_date
      t.string :answer
      t.string :progress
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
