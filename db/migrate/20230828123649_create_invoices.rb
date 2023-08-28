class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :number
      t.float :amount
      t.date :emission_date
      t.date :payment_date
      t.text :comment
      t.string :progress
      t.references :user, null: false, foreign_key: true
      t.references :debtor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
