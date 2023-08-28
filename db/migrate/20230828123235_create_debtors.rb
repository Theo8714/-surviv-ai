class CreateDebtors < ActiveRecord::Migration[7.0]
  def change
    create_table :debtors do |t|
      t.string :company_name
      t.string :siren

      t.timestamps
    end
  end
end
